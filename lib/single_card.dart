import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  TaskItem({required this.title, required this.subtitle, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Circle at the left
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
            SizedBox(width: 8), // Space between circle and text
            // Column with heading and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Glacial Indifference',
                    ),
                  ),
                  SizedBox(height: 4), // Space between title and subtitle
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Glacial Indifference',
                    ),
                  ),
                ],
              ),
            ),
            // Date box at the right
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Glacial Indifference',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TaskItem(
            title: '! Create a resume',
            subtitle: 'Become a millionaire',
            date: 'Today',
          ),
          // Add more TaskItem widgets as needed
        ],
      ),
    ),
  ));
}
