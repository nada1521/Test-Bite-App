import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import '../../../../../core/helper/error/failure.dart';
import '../models/user_login_request_body.dart';

class LoginRepo {
// final  SupabaseAuthService _authService;
  // LoginRepo(this._authService);

  // Future<String> login(UserLoginRequestBody userLoginRequestBody) async {
  //   try {
  //     AuthResponse response = await _authService.loginWithEmailAndPassword(
  //       email: userLoginRequestBody.email,
  //       password: userLoginRequestBody.password,
  //     );
  //     if (response.user != null) {
  //       final session = response.session;
  //       if (session?.accessToken != null) {
  //         // save user token
  //         await _saveToken(session!.accessToken);
  //         // Save User Fcm Token
  //         await _saveFcmToken(userLoginRequestBody.fcmToken);
  //         // get user data from supabase
  //         // SupabaseUserResponse supabaseUser =
  //         //     await SupabaseDatabase.getUserData(email: session.user.email!);
  //         // // Update UserFcm Token
  //         // await SupabaseDatabase.setUserFcmToken(
  //         //   userLoginRequestBody.fcmToken,
  //         //   userLoginRequestBody.email,
  //         // );
  //         // save user data on local database
  //         // await HiveHelper.saveUserData(
  //         //   CachedUserModel(
  //         //     name: supabaseUser.userName,
  //         //     email: supabaseUser.email,
  //         //     address: supabaseUser.address,
  //         //     phoneNumber: supabaseUser.phoneNumber,
  //         //   ),
  //         // );
  //       }
  //       return 'success';
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     if (e is AuthException) {
  //       return e.code!;
  //     } else {
  //       return 'unexpected_error';
  //     }
  //   }
  //   return 'error';
  // }

  // Future<void> _saveToken(String token) async {
  //   await CacheHelper.setSecuredString(AppConstants.userToken, token);
  // }

  // Future<void> _saveFcmToken(String fcmToken) async {
  //   await CacheHelper.setSecuredString(AppConstants.userToken, fcmToken);
  // }


Future<ApiResult> firebaseLogin(UserLoginRequestBody  signinRequestModel)async{
    try {
      final firebase = FirebaseAuth.instance;
      final respons = await firebase.signInWithEmailAndPassword(
        email: signinRequestModel.email,
        password: signinRequestModel.password,
      );
      return ApiResult.success(respons);
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
