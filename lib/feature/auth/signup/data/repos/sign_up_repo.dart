import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/Networking/local_database/helper/hive_helper.dart';
import '../../../../../core/Networking/local_database/models/cached_user_model.dart';
import '../../../../../core/Networking/supabase/repos/supabase_auth_service.dart';
import '../../../../../core/Networking/supabase/repos/supabase_database.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/helper/cache_helper.dart';
import '../models/user_sign_up_request_body.dart';

class SignupRepo {
  final SupabaseAuthService _authService;
  SignupRepo(this._authService);

  Future<String> signup(UserSignUpRequestBody signupRequestBody) async {
    try {
      // Sighnup User
      AuthResponse response = await _authService.signupWithEmailAndPassword(
        email: signupRequestBody.email,
        password: signupRequestBody.password,
      );

      // check user sighnup sates
      if (response.user != null) {
        final session = response.session;
        if (session?.accessToken != null) {
          await _saveToken(session!.accessToken);
        }
        // save user on online database
        await SupabaseDatabase.insertUserData(
          userSignUpRequestBody: signupRequestBody,
        );
        // save user on local database
        await HiveHelper.saveUserData(
          CachedUserModel(
            name: signupRequestBody.userName,
            email: signupRequestBody.email,
            address: signupRequestBody.address,
            phoneNumber: signupRequestBody.phoneNumber,
          ),
        );
        return 'success';
      }
    } catch (e) {
      if (e is AuthException) {
        return e.code!;
      } else {
        return 'unexpected_error';
      }
    }

    return 'error';
  }

  Future<void> _saveToken(String token) async {
    await CacheHelper.setSecuredString(AppConstants.userToken, token);
  }
}
