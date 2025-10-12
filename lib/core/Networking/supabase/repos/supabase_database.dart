// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../../../feature/auth/signup/data/models/user_sign_up_request_body.dart';
// import '../../../utils/app_secure_constants.dart';
// import '../models/supabase_user_model.dart';
// import '../helper/supabase_constanc.dart';

// class SupabaseDatabase {
//   static final SupabaseClient _supabase = Supabase.instance.client;

//   static Future<void> insertUserData(
//       {required UserSignUpRequestBody userSignUpRequestBody}) async {
//     await _supabase
//         .from(SupabaseConstanc.usersTable)
//         .insert(userSignUpRequestBody.toJson());
//   }
//   Future<void> initSupabase() async {
//     await Supabase.initialize(
//       url: AppSecureConstants.supabaseUrl,
//       anonKey: AppSecureConstants.supabaseAnonKey,
//       authOptions: const FlutterAuthClientOptions(
//         authFlowType: AuthFlowType.pkce,
//       ),
//       realtimeClientOptions: const RealtimeClientOptions(
//         logLevel: RealtimeLogLevel.info,
//       ),
//       storageOptions: const StorageClientOptions(
//         retryAttempts: 10,
//       ),
//     );
//   }


//   static Future<SupabaseUserResponse> getUserData(
//       {required String email}) async {
//     Map<String, dynamic> res = await _supabase
//         .from(SupabaseConstanc.usersTable)
//         .select()
//         .eq('email', email)
//         .single();
//     return SupabaseUserResponse.fromJson(res);
//   }

//   static Future<void> setUserFcmToken(String fcmToken, String email) async {
//     await _supabase
//         .from(SupabaseConstanc.usersTable)
//         .update({'fcm_token': fcmToken}).eq('email', email);
//   }
// }
