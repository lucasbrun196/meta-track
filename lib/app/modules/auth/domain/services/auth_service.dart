import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User> signIn({required String email, required String password});
}
