import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/splash/presenter/splash_view.dart';

class SplashModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => SplashView());
  }
}
