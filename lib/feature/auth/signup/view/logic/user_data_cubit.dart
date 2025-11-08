import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasty_bite/feature/auth/signup/view/logic/user_data_state.dart';
import '../../../../../core/constants/firebase_strings.dart';
import '../../data/models/signup_request.dart';


class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  Future<SignupRequestModel?> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;

    final doc = await FirebaseFirestore.instance
        .collection(FirebaseStrings.users)
        .doc(uid)
        .get();

    if (!doc.exists) return null;

    return SignupRequestModel.fromJson(doc.data()!);
  }

  Future<void> loadUserData() async {
    try {
      emit(UserDataLoading());
      final user = await getUserData();
      if (user == null) {
        emit(UserDataError("No User data"));
      } else {
        emit(UserDataSuccess(user));
      }
    } catch (e) {
      emit(UserDataError(e.toString()));
    }
  }
}