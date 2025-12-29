import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';

abstract class AuthDatasource {
  Future<User> signIn(UserCredentials userCredentials);

  Future<String> signUp(UserCredentialsSignUp userCredentialsSignUp);

  Future<void> createUser(Map<String, dynamic> map);

  Future<void> resetPassword({required String email});
}
