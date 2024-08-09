// lib/models.dart

class Goal {
  final String description_g;
  final int completionPercentage;
  final String due_on;
  final int priority;

  Goal({
    required this.description_g,
    required this.completionPercentage,
    required this.due_on,
    required this.priority,
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
