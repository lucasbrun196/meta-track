import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_controller.dart';

class CoreCubitModuleBinds extends Module {
  @override
  void exportedBinds(i) => i.addLazySingleton(CoreCubitController.new);
}
