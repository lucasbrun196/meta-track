import 'package:meta_track/app/modules/meta_track/domain/entities/goals.dart';

abstract class MetaTrackRepository {
  Future<List<String>> getUserGoalsReference(String userId);

  Future<GoalsEntity> getGoal(String reference);
}
