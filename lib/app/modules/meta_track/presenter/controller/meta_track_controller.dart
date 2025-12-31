import 'package:bloc/bloc.dart';

part 'meta_track_state.dart';

class MetaTrackController extends Cubit<MetaTrackState> {
  MetaTrackController() : super(MetaTrackState.initial());
}
