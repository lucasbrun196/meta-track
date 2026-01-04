import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/auth/auth_module.dart';
import 'package:meta_track/app/modules/meta_track/meta_track_modules.dart';
import 'package:meta_track/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/auth', module: AuthModule());
    r.module('/meta-track', module: MetaTrackModules());
  }
}
