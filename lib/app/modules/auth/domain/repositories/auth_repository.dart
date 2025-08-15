import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';

abstract class AuthRepository {
  Future<User> signIn(String email, String password);

  Future<String> signUp(String name, String email, String password);

  Future<void> createUser(UserCredentialsSignUp userCredentials);
}
