import 'package:flutter/material.dart';
import 'goal_card.dart';
import 'goal_task_card.dart';
import 'models.dart';

class GoalList extends StatelessWidget {
  final List<Goal> goals;

  GoalList({required this.goals});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Goals',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'GlacialIndifference'),
          ),
          SizedBox(height: 8),
          Text(
            'Our app focuses on all text inputs. Just enter what you need to get done and by when or any other constraints and we’ll understand!',
            style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'GlacialIndifference'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: goals.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoalCard(goal: goals[index]),
                    ...goals[index].goalTasks.map((goalTask) {
                      return GoalTaskCard(goalTask: goalTask);
                    }).toList(),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
