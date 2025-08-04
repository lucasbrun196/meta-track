import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/splash/data/datasource/splash_datasource.dart';

class SplashDatasourceImp implements SplashDatasource {
  final FirebaseAuth firebaseAuth;
  SplashDatasourceImp({required this.firebaseAuth});
  @override
  User? getCurrentUser() => firebaseAuth.currentUser;
}
