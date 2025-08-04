import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/splash/data/datasource/splash_datasource.dart';
import 'package:meta_track/app/modules/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImp implements SplashRepository {
  final SplashDatasource splashDatasource;

  SplashRepositoryImp({required this.splashDatasource});
  @override
  User? getCurrentUser() => splashDatasource.getCurrentUser();
}
