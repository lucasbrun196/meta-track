import 'package:meta_track/app/modules/auth/domain/entities/user_credentials.dart';

class UserCredentialsDto {
  static UserCredentials fromValues(String email, String password) {
    return UserCredentials(email: email, password: password);
  }
}
