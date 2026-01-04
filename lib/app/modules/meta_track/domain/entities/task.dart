import 'package:meta_track/app/modules/meta_track/domain/entities/task_status.dart';

class TaskEntity {
  final String title;
  final TaskStatus status;

  TaskEntity({
    required this.title,
    required this.status,
  });
}
