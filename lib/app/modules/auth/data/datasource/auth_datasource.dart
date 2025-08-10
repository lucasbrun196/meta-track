import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials.dart';

abstract class AuthDatasource {
  Future<User> signIn(UserCredentials userCredentials);
}
