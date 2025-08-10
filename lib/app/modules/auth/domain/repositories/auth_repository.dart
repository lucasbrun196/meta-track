import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User> signIn(String email, String password);
}
