import 'package:meta_track/app/modules/meta_track/domain/entities/goals.dart';
import 'package:meta_track/app/modules/meta_track/domain/repositories/meta_track_repository.dart';
import 'package:meta_track/app/modules/meta_track/domain/services/meta_track_service.dart';

class MetaTrackServiceImp implements MetaTrackService {
  final MetaTrackRepository metaTrackRepository;
  MetaTrackServiceImp({required this.metaTrackRepository});
  @override
  Future<List<String>> getUserGoalsReference(String userId) {
    return metaTrackRepository.getUserGoalsReference(userId);
  }

  @override
  Future<List<GoalsEntity>> getGoals(List<String> references) async {
    final result = await Future.wait(
        references.map((e) => metaTrackRepository.getGoal(e)).toList());
    return result;
  }
}
