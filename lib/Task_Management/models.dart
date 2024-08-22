// lib/models.dart
class GoalTask {
  final String description_gt;
  final String due_on;
  final bool isCompleted;

  GoalTask({
    required this.description_gt,
    required this.due_on,
    this.isCompleted = false,
  });
}

class Goal {
  final String description_g;
  final int completionPercentage;
  final String due_on;
  final int priority;
  final List<GoalTask> goalTasks; // Add this property

  Goal({
    required this.description_g,
    required this.completionPercentage,
    required this.due_on,
    required this.priority,
    required this.goalTasks, // Add this parameter
  });
}

class Task {
  final String description_t;
  final String goal;
  final String due_on;
  final int priority;
  final String location;

  Task({
    required this.description_t,
    required this.goal,
    required this.due_on,
    required this.priority,
    required this.location,
  });
}
