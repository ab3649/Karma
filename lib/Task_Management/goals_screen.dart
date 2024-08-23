import 'package:flutter/material.dart';
import 'goal_list.dart';  // Import the new file
import 'models.dart';

class GoalsScreen extends StatelessWidget {
  final List<Goal> goals = [
    Goal(
      description_g: 'Become a UI-UX Designer',
      completionPercentage: 50,
      due_on: '2024-08-31',
      priority: 1,
      goalTasks: [
        GoalTask(description_gt: 'Create a resume', due_on: 'Tomorrow'),
        GoalTask(description_gt: 'Apply for internships', due_on: 'Tomorrow'),
      ],
    ),
    Goal(
      description_g: 'Get a Job',
      completionPercentage: 50,
      due_on: '2024-09-30',
      priority: 2,
      goalTasks: [
        GoalTask(description_gt: 'Create a resume', due_on: 'Tomorrow'),
        GoalTask(description_gt: 'Prepare for interviews', due_on: 'Tomorrow'),
      ],
    ),
    Goal(
      description_g: 'Get a Job',
      completionPercentage: 50,
      due_on: '2024-09-30',
      priority: 2,
      goalTasks: [
        GoalTask(description_gt: 'Create a resume', due_on: 'Tomorrow'),
        GoalTask(description_gt: 'Prepare for interviews', due_on: 'Tomorrow'),
      ],
    ),
    Goal(
      description_g: 'Get a Job',
      completionPercentage: 50,
      due_on: '2024-09-30',
      priority: 2,
      goalTasks: [
        GoalTask(description_gt: 'Create a resume', due_on: 'Tomorrow'),
        GoalTask(description_gt: 'Prepare for interviews', due_on: 'Tomorrow'),
      ],
    ),
    Goal(
      description_g: 'Get a Job',
      completionPercentage: 50,
      due_on: '2024-09-30',
      priority: 2,
      goalTasks: [
        GoalTask(description_gt: 'Create a resume', due_on: 'Tomorrow'),
        GoalTask(description_gt: 'Prepare for interviews', due_on: 'Tomorrow'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Set the background color to white
      // appBar: AppBar(title: Text('Goals')),
      body: GoalList(goals: goals),  // Use the new GoalList widget
    );
  }
}
