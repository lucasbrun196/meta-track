import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_controller.dart';
import 'package:meta_track/app/modules/auth/auth_module.dart';
import 'package:meta_track/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(CoreCubitController.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/auth', module: AuthModule());
  }
}
