import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/Networking/api_result.dart';
import '../../../../../core/helper/error/failure.dart';
import '../models/signup_request.dart';

class SignupRepos {
  Future<ApiResult> sendEmailLink(SignupRequestModel signupRequestModel) async {
    try {
      final ActionCodeSettings acs = ActionCodeSettings(
        url: 'https://asmaq-thraa.firebaseapp.com/finishSignUp',
        handleCodeInApp: true,
        androidPackageName: 'com.example.android',
        androidInstallApp: true,
        androidMinimumVersion: '12',
        iOSBundleId: 'com.example.ios',
      );

      final firebase = FirebaseAuth.instance;
      await firebase.sendSignInLinkToEmail(
        email: signupRequestModel.email,
        actionCodeSettings: acs,
      );

      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString(saveEmail, signupRequestModel.email);
      log('Successfully sent email verification link');
      return ApiResult.success("Link sent successfully");
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
