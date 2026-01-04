import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta_track/app/modules/meta_track/data/datasource/meta_track_datasource.dart';
import 'package:meta_track/app/modules/meta_track/domain/repositories/meta_track_repository.dart';

class MetaTrackRepositoryImp implements MetaTrackRepository {
  final MetaTrackDatasource metaTrackDatasource;
  MetaTrackRepositoryImp({
    required this.metaTrackDatasource,
  });
  @override
  Future<List<String>> getUserGoalsReference(String userId) async {
    final result = await metaTrackDatasource.getUserGoalsReference(userId);
    final references = List<DocumentReference>.from(result['goals']);

    return references.map((e) => e.path).toList();
  }
}
