import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';
import 'package:meta_track/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:meta_track/app/modules/auth/domain/services/auth_service.dart';

class AuthServiceImp implements AuthService {
  final AuthRepository authRepository;
  AuthServiceImp({
    required this.authRepository,
  });

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) {
    return authRepository.signIn(email, password);
  }

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    return authRepository.signUp(name, email, password);
  }

  @override
  Future<void> createUser(UserCredentialsSignUp userCredentials) async {
    return authRepository.createUser(userCredentials);
  }
}
