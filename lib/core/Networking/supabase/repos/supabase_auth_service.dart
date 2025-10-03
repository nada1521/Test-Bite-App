import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signupWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    return await _supabase.auth.signUp(password: password, email: email);
  }

  Future<AuthResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  Future<void> signOut() async {
    // await SharedPrefHelper.clearAllSecuredData();
    // await HiveHelper.deleteUserData();

    await _supabase.auth.signOut();
  }

  String? getUserEmail() {
    final session = _supabase.auth.currentSession;
    return session!.user.email;
  }

  Future<void> deleteAccount() async {
    try {
      await Supabase.instance.client.from('users').delete().match({
        'email': Supabase.instance.client.auth.currentUser!.email!,
      });
      _supabase.auth.admin.deleteUser(
        Supabase.instance.client.auth.currentUser!.email!,
      );
      await signOut();
      // await CacheHelper.clearAllSecuredData();
      // await HiveHelper.deleteUserData();
      // await HiveHelper.removeAllFavoriteProducts();
    } catch (e) {
      throw Exception('Error deleting account: $e');
    }
  }
}
