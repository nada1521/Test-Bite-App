import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import '../../../../../core/helper/error/failure.dart';
import '../models/user_login_request_body.dart';

class LoginRepo {
  Future<ApiResult> firebaseLogin(
    UserLoginRequestBody signinRequestModel,
  ) async {
    try {
      final firebase = FirebaseAuth.instance;
      final respons = await firebase.signInWithEmailAndPassword(
        email: signinRequestModel.email,
        password: signinRequestModel.password,
      );
      return ApiResult.success(respons);
    } on FirebaseAuthException catch (firebaseError) {
      log('FirebaseAuthException: ${firebaseError.code} - ${firebaseError.message}');
    
      return ApiResult.failure(
        FailureServer.fromFirebaseAuthException(firebaseError),
      );
    } on PlatformException catch (platformError) {
       log('PlatformException: ${platformError.code} - ${platformError.message}');
    // معالجة PlatformException
      log('PlatformException: ${platformError.code} - ${platformError.message}');
   
      return ApiResult.failure(
        FailureServer.fromPlatformException(platformError),
      );
    } on DioException catch (dioError) {
      return ApiResult.failure(FailureServer.fromDioException(dioError));
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }
}
