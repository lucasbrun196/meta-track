enum GoalStatus {
  done,
  doing,
  todo,
}

extension GoalsStatusMethods on GoalStatus {
  static GoalStatus createFromString(String s) {
    return {
          'done': GoalStatus.done,
          'doing': GoalStatus.doing,
          'todo': GoalStatus.todo,
        }[s] ??
        GoalStatus.todo;
  }
}
