import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/core/core_cubit_binds.dart';
import 'package:meta_track/app/modules/meta_track/meta_track_module_binds.dart';
import 'package:meta_track/app/modules/meta_track/presenter/controller/meta_track_controller.dart';
import 'package:meta_track/app/modules/meta_track/presenter/meta_track_view.dart';

class MetaTrackModules extends Module {
  @override
  List<Module> get imports => [
        MetaTrackModuleBinds(),
        CoreCubitModuleBinds(),
      ];
  @override
  void binds(i) {
    i.addLazySingleton(MetaTrackController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => MetaTrackView(controller: Modular.get()));
  }
}
