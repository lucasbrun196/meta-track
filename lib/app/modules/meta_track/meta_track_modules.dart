import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta_track/app/modules/meta_track/presenter/meta_track_view.dart';

class MetaTrackModules extends Module{
  @override
  void routes(r){
    r.child('/', child: (_) => MetaTrackView());
  }

}