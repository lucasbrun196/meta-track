import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/meta_track/data/datasource/meta_track_datasource.dart';
import 'package:meta_track/app/modules/meta_track/data/repositories/meta_track_repository_imp.dart';
import 'package:meta_track/app/modules/meta_track/datasource/meta_track_datasource_imp.dart';
import 'package:meta_track/app/modules/meta_track/domain/repositories/meta_track_repository.dart';
import 'package:meta_track/app/modules/meta_track/domain/services/meta_track_service.dart';
import 'package:meta_track/app/modules/meta_track/domain/services/meta_track_service_imp.dart';

class MetaTrackModuleBinds extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<MetaTrackService>(MetaTrackServiceImp.new);
    i.addLazySingleton<MetaTrackRepository>(MetaTrackRepositoryImp.new);
    i.addLazySingleton<MetaTrackDatasource>(MetaTrackDatasourceImp.new);
    i.addInstance(FirebaseFirestore.instance);
  }
}
