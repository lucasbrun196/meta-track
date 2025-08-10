import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:meta_track/app/modules/auth/domain/entities/user_credentials.dart';

class AuthDatasourceImp implements AuthDatasource {
  final FirebaseAuth firebaseAuth;
  AuthDatasourceImp({required this.firebaseAuth});
  @override
  Future<User> signIn(UserCredentials userCredentials) async {
    return firebaseAuth
        .signInWithEmailAndPassword(
            email: userCredentials.email, password: userCredentials.password)
        .then((value) => value.user!);
  }
}
