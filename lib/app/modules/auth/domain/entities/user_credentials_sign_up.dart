import 'package:meta_track/app/modules/auth/domain/entities/user_credentials.dart';

class UserCredentialsSignUp extends UserCredentials {
  final String? uid;
  final String name;

  UserCredentialsSignUp({
    this.uid,
    required this.name,
    required super.email,
    required super.password,
  });
}
