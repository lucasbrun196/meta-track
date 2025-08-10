import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:meta_track/app/modules/auth/data/dto/user_credentials_dto.dart';
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
}
