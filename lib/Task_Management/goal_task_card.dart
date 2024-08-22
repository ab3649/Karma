// lib/goal_task_card.dart
import 'package:flutter/material.dart';
import 'models.dart';

class GoalTaskCard extends StatelessWidget {
  final GoalTask goalTask;

  GoalTaskCard({required this.goalTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(vertical: 4),
        elevation: 2,
        child: ListTile(
          leading: Radio(
            value: goalTask.isCompleted,
            groupValue: false,
            onChanged: (value) {
              // Handle task completion logic here
            },
          ),
          title: Text(
            goalTask.description_gt,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'GlacialIndifference',
              color: Colors.black,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.yellow[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              goalTask.due_on,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'GlacialIndifference',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
