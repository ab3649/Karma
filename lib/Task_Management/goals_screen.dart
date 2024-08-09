// lib/goals_screen.dart
import 'package:flutter/material.dart';
import 'goal_card.dart'; // Import the GoalCard widget
import 'models.dart'; // Import the models

class GoalsScreen extends StatelessWidget {
  final List<Goal> goals = [
    Goal(
      description_g: 'Become a UI-UX Designer',
      completionPercentage: 50,
      due_on: '2024-08-31',
      priority: 1,
    ),
    Goal(
      description_g: 'Get a Job',
      completionPercentage: 50,
      due_on: '2024-09-30',
      priority: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your goals',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'GlacialIndifference',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our app focuses on all text inputs. Just enter what you need to get done and by when or any other constraints and we’ll understand!',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GlacialIndifference',
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return GoalCard(goal: goals[index]);
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF1D5EBE),
      //   onPressed: () {
      //     // Implement your action here
      //   },
      //   child: Icon(Icons.add, color: Colors.white, size: 30),
      // ),
    );
  }
}
