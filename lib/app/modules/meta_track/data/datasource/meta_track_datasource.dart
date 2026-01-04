abstract class MetaTrackDatasource {
  Future<Map<String, dynamic>> getUserGoalsReference(String userId);

  Future<Map<String, dynamic>> getGoal(String reference);
}
