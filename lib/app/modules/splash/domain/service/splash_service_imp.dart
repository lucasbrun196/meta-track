import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_track/app/modules/splash/domain/repository/splash_repository.dart';
import 'package:meta_track/app/modules/splash/domain/service/splash_service.dart';

class SplashServiceImp implements SplashService {
  final SplashRepository splashRepository;
  SplashServiceImp({
    required this.splashRepository,
  });

  @override
  User getCurrentUser() {
    final User? user = splashRepository.getCurrentUser();
    if (user == null) {
      throw Exception();
    }
    return user;
  }
}
