import 'package:meta_track/app/modules/meta_track/domain/entities/goals.dart';

abstract class MetaTrackService {
  Future<List<String>> getUserGoalsReference(String userId);
}
