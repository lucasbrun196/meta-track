import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashDatasource {
  User? getCurrentUser();
}
