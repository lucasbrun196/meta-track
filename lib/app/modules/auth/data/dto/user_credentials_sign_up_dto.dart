import 'package:meta_track/app/modules/auth/domain/entities/user_credentials_sign_up.dart';

class UserCredentialsSignUpDto {
  static UserCredentialsSignUp fromValues(
      String name, String email, String password) {
    return UserCredentialsSignUp(name: name, email: email, password: password);
  }

  static Map<String, dynamic> toMap(
      UserCredentialsSignUp userCredentialsSignUp) {
    return {
      'uid': userCredentialsSignUp.uid!,
      'name': userCredentialsSignUp.name,
      'email': userCredentialsSignUp.email,
    };
  }
}
