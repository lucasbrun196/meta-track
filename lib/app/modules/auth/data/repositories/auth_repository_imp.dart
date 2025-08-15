import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:meta_track/app/modules/auth/data/dto/user_credentials_dto.dart';
import 'package:meta_track/app/modules/auth/data/dto/user_credentials_sign_up_dto.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';
import 'package:meta_track/app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImp({
    required this.authDatasource,
  });

  @override
  Future<User> signIn(String email, String password) {
    final userCredentials = UserCredentialsDto.fromValues(email, password);
    return authDatasource.signIn(userCredentials);
  }

  @override
  Future<String> signUp(String name, String email, String password) {
    final userCredentialsSignUp =
        UserCredentialsSignUpDto.fromValues(name, email, password);
    return authDatasource.signUp(userCredentialsSignUp);
  }

  @override
  Future<void> createUser(UserCredentialsSignUp userCredentialsSignUp) {
    final map = UserCredentialsSignUpDto.toMap(userCredentialsSignUp);
    return authDatasource.createUser(map);
  }
}
