import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_controller.dart';
import 'package:meta_track/app/modules/splash/domain/service/splash_service.dart';

class SplashController {
  final SplashService _splashService;
  final CoreCubitController coreCubitController;
  SplashController(this._splashService, this.coreCubitController);

  void getCurrentUser() {
    try {
      final user = _splashService.getCurrentUser();
      coreCubitController.setCurrentUser(user);
    } catch (error) {
      redirectToLogin();
    }
  }

  void redirectToLogin() => Modular.to.pushReplacementNamed('/auth/login');
}
