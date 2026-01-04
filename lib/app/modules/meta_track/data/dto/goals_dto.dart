import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta_track/app/modules/meta_track/data/dto/task_dto.dart';
import 'package:meta_track/app/modules/meta_track/domain/entities/goals.dart';
import 'package:meta_track/app/modules/meta_track/domain/entities/goals_status.dart';

class GoalsDto {
  static GoalsEntity fromMap(Map<String, dynamic> m) {
    return GoalsEntity(
      deadline: (m['deadline'] as Timestamp).toDate(),
      status: GoalsStatusMethods.createFromString(m['status'] as String),
      title: m['title'] as String,
      tasks: List<Map<String, dynamic>>.from(m['tasks'])
          .map((e) => TaskDto.fromMap(e))
          .toList(),
    );
  }
}
