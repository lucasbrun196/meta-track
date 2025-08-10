import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:meta_track/app/modules/auth/data/repositories/auth_repository_imp.dart';
import 'package:meta_track/app/modules/auth/datasource/firebase_auth/auth_datasource_imp.dart';
import 'package:meta_track/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:meta_track/app/modules/auth/domain/services/auth_service.dart';
import 'package:meta_track/app/modules/auth/domain/services/auth_service_imp.dart';

class AuthModuleBinds extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<AuthService>(AuthServiceImp.new);
    i.addLazySingleton<AuthRepository>(AuthRepositoryImp.new);
    i.addLazySingleton<AuthDatasource>(AuthDatasourceImp.new);
    i.addInstance(FirebaseAuth.instance);
  }
}
