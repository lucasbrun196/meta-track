import 'package:meta_track/app/modules/meta_track/domain/entities/task.dart';
import 'package:meta_track/app/modules/meta_track/domain/entities/task_status.dart';

class TaskDto {
  static TaskEntity fromMap(Map<String, dynamic> m) {
    return TaskEntity(
      title: m['title'] as String,
      status: TaskStatusMethods.createFromString(
        m['status'] as String,
      ),
    );
  }
}
