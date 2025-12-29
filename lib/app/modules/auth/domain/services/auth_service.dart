import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';

abstract class AuthService {
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> createUser(UserCredentialsSignUp userCredentials);

  Future<void> resetPassword({required String email});
}
