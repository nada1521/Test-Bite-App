import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

abstract class Failures {
  final String errorMessage;

  Failures(this.errorMessage);

  @override
  String toString() => errorMessage;
}

class FailureServer extends Failures {
  FailureServer(super.errorMessage);

  factory FailureServer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return FailureServer('Conection timeOut with ApiServer');
      case DioExceptionType.sendTimeout:
        return FailureServer('Send  timeOut with ApiServer');
      case DioExceptionType.receiveTimeout:
        return FailureServer('Receive  timeOut with ApiServer');
      case DioExceptionType.badCertificate:
        return FailureServer('Certificate  timeOut with ApiServer');
      case DioExceptionType.cancel:
        return FailureServer('Request to ApiServer with cancel');
      case DioExceptionType.connectionError:
        return FailureServer('No internet connection');
      case DioExceptionType.unknown:
        return FailureServer('Unexpected error, please try again!');
      default:
        return FailureServer('oops there was an error , please try again');
    }
  }

  factory FailureServer.fromPlatformException(PlatformException exception) {
    switch (exception.code) {
      case 'ERROR_INVALID_CREDENTIAL':
        return FailureServer('البريد الإلكتروني أو كلمة المرور غير صحيحة.');
      case 'ERROR_NETWORK_REQUEST_FAILED':
        return FailureServer('حدث خطأ في الاتصال بالإنترنت');
      case 'ERROR_USER_NOT_FOUND':
        return FailureServer('الحساب غير موجود.');
      case 'ERROR_WRONG_PASSWORD':
        return FailureServer('كلمة المرور غير صحيحة.');
      case 'ERROR_TOO_MANY_REQUESTS':
        return FailureServer('محاولات تسجيل الدخول كثيرة، حاول لاحقًا.');
      default:
        return FailureServer(exception.message ?? 'حدث خطأ غير متوقع.');
    }
  }

  factory FailureServer.fromFirebaseAuthException(
    FirebaseAuthException firebaseAuthException,
  ) {
    switch (firebaseAuthException.code) {
      // الكود الجديد - مهم جداً!
      case 'invalid-credential':
        return FailureServer('البريد الإلكتروني أو كلمة المرور غير صحيحة.');
      case 'invalid-email':
        return FailureServer('البريد الإلكتروني غير صالح.');
      case 'user-disabled':
        return FailureServer('تم تعطيل هذا الحساب.');
      case 'user-not-found':
        return FailureServer('الحساب غير موجود.');
      case 'wrong-password':
        return FailureServer('كلمة المرور غير صحيحة.');
      case 'email-already-in-use':
        return FailureServer('هذا البريد مستخدم بالفعل');
      case 'operation-not-allowed':
        return FailureServer('هذه العملية غير مسموح بها');
      case 'weak-password':
        return FailureServer('كلمة المرور ضعيفة جدًا');
      case 'too-many-requests':
        return FailureServer('محاولات تسجيل الدخول كثيرة، حاول لاحقًا.');
      case 'network-request-failed':
        return FailureServer('حدث خطأ في الاتصال بالإنترنت');
      case 'channel-error':
        return FailureServer('حدث خطأ في الاتصال، حاول مرة أخرى.');
      default:
        log(
          'حدث خطأ غير معروف: ${firebaseAuthException.code} - ${firebaseAuthException.message}',
        );
        return FailureServer('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.');
    }
  }
}
