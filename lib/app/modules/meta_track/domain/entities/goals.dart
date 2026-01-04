import 'package:meta_track/app/modules/meta_track/domain/entities/goals_status.dart';
import 'package:meta_track/app/modules/meta_track/domain/entities/task.dart';

class GoalsEntity {
  final DateTime deadline;
  final GoalStatus status;
  final String title;
  final List<TaskEntity> tasks;

  GoalsEntity({
    required this.deadline,
    required this.status,
    required this.title,
    required this.tasks,
  });
}
