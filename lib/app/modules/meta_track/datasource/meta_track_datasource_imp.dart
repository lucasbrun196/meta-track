import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta_track/app/modules/meta_track/data/datasource/meta_track_datasource.dart';

class MetaTrackDatasourceImp implements MetaTrackDatasource {
  final FirebaseFirestore firebaseFirestore;
  MetaTrackDatasourceImp({required this.firebaseFirestore});
  @override
  Future<Map<String, dynamic>> getUserGoalsReference(String userId) async {
    final doc =
        await firebaseFirestore.collection('user_goals').doc(userId).get();
    final data = doc.data();
    if (data == null) return {'goals': []};
    return data;
  }
}
