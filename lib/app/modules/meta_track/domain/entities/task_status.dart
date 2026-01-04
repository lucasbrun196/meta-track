enum TaskStatus {
  done,
  doing,
  todo,
}

extension TaskStatusMethods on TaskStatus {
  static TaskStatus createFromString(String s) {
    return {
          'done': TaskStatus.done,
          'doing': TaskStatus.doing,
          'todo': TaskStatus.todo,
        }[s] ??
        TaskStatus.todo;
  }
}
