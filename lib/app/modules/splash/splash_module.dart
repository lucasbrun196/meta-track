import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_binds.dart';
import 'package:meta_track/app/core/core_cubit_controller.dart';
import 'package:meta_track/app/modules/splash/data/datasource/splash_datasource.dart';
import 'package:meta_track/app/modules/splash/data/repository/splash_repository_imp.dart';
import 'package:meta_track/app/modules/splash/datasource/firebase_auth/splash_datasource_imp.dart';
import 'package:meta_track/app/modules/splash/domain/repository/splash_repository.dart';
import 'package:meta_track/app/modules/splash/domain/service/splash_service.dart';
import 'package:meta_track/app/modules/splash/domain/service/splash_service_imp.dart';
import 'package:meta_track/app/modules/splash/presenter/controller/splash_controller.dart';
import 'package:meta_track/app/modules/splash/presenter/splash_view.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CoreCubitModuleBinds(),
      ];
  @override
  void binds(i) {
    i.addInstance(FirebaseAuth.instance);
    i.addLazySingleton<SplashDatasource>(SplashDatasourceImp.new);
    i.addLazySingleton<SplashRepository>(SplashRepositoryImp.new);
    i.addLazySingleton<SplashService>(SplashServiceImp.new);
    i.addLazySingleton(SplashController.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => SplashView(
              controller: Modular.get(),
            ));
  }
}
