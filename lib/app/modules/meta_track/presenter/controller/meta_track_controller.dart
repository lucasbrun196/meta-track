import 'package:bloc/bloc.dart';
import 'package:meta_track/app/core/core_cubit_controller.dart';
import 'package:meta_track/app/modules/meta_track/domain/services/meta_track_service.dart';

part 'meta_track_state.dart';

class MetaTrackController extends Cubit<MetaTrackState> {
  final MetaTrackService service;
  final CoreCubitController coreCubitController;
  MetaTrackController(
      {required this.service, required this.coreCubitController})
      : super(MetaTrackState.initial());

  void getGoals() async {
    emit(state.copyWith(status: MetaTrackStatus.loading));
    try {
      final userId = coreCubitController.getCurretUser!.uid;
      final references = await service.getUserGoalsReference(userId);
      emit(state.copyWith(status: MetaTrackStatus.success));
    } catch (err) {
      emit(state.copyWith(status: MetaTrackStatus.failure));
    }
  }
}
