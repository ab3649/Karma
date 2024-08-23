// lib/goal_card.dart
import 'package:flutter/material.dart';
import 'models.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1), // Outline border
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, // Background color of the card
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  goal.description_g,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'GlacialIndifference-bold',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF53CB34),
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
              IconButton(
                // icon: Icon(Icons.edit, color: Colors.black), onPressed: () {  },
                icon: Image.asset('assets/icons/Vector.png'), onPressed: () {  }, // Use the custom image here
              ),
            ],
          ),
          // SizedBox(height: 8),
          // Row(
          //   children: [
          //     Text(
          //       'Due on: ${goal.due_on}',
          //       style: TextStyle(
          //         fontSize: 14,
          //         fontFamily: 'GlacialIndifference',
          //       ),
          //     ),
          //     SizedBox(width: 16),
          //     Text(
          //       'Priority: ${goal.priority}',
          //       style: TextStyle(
          //         fontSize: 14,
          //         fontFamily: 'GlacialIndifference',
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
