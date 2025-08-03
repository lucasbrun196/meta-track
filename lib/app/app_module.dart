import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: SplashModule());
  }
}
