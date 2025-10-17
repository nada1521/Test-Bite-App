import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/Networking/api_result.dart';
import '../../../../../core/helper/error/failure.dart';
import '../models/signup_request.dart';

class SignupRepos {

  Future<ApiResult> signUp(SignupRequestModel signupRequestModel) async {
    final CollectionReference usersCollection = FirebaseFirestore.instance
        .collection('users');
    try {
      final firebase = FirebaseAuth.instance;
      final userCredential = await firebase.createUserWithEmailAndPassword(
        email: signupRequestModel.email,
        password: signupRequestModel.password,
      );
      await usersCollection
          .doc(userCredential.user!.uid)
          .set(signupRequestModel.toJson());
      return ApiResult.success(userCredential);
    } on FirebaseAuthException catch (firebaseError) {
      return ApiResult.failure(
        FailureServer.fromFirebaseAuthException(firebaseError),
      );
    } on DioException catch (dioError) {
      return ApiResult.failure(FailureServer.fromDioException(dioError));
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }
}
