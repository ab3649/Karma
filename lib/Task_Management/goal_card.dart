// lib/goal_card.dart
import 'package:flutter/material.dart';
import 'models.dart'; // Import the models

class GoalCard extends StatelessWidget {
  final Goal goal;

  GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    goal.description_g,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GlacialIndifference',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    '${goal.completionPercentage}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Due on: ${goal.due_on}',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'GlacialIndifference',
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'Priority: ${goal.priority}',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'GlacialIndifference',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
