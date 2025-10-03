import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      case DioException.connectionError:
        return FailureServer('No internet connection');
      case DioExceptionType.unknown:
        return FailureServer('Unexpected error, please try again!');
      default:
        return FailureServer('oops there was an error , please try again');
    }
  }
  factory FailureServer.fromFirebaseAuthException(
    FirebaseAuthException firebaseAuthException,
  ) {
    switch (firebaseAuthException.code) {
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

      default:
        log('حدث خطأ غير معروف: ${firebaseAuthException.message}');
        return FailureServer(
          'حدث خطأ غير معروف: ${firebaseAuthException.message}',
        );
    }
  }
}
