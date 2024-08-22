// lib/vertical_card_list.dart
import 'package:flutter/material.dart';
import 'task_item.dart'; // Import the TaskItem widget

class VerticalCardList extends StatelessWidget {
  final int selectedCardIndex;
  final VoidCallback onEditPressed;

  VerticalCardList({
    required this.selectedCardIndex,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Define content for each card
    final List<List<String>> cardItems = [
      ['Item 1 for Card 0', 'Item 2 for Card 0', 'Item 0 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0', 'Item 1 for Card 0',],
      ['Item 1 for Card 1', 'Item 2 for Card 1', 'Item 1 for Card 1'],
      ['Item 1 for Card 2', 'Item 2 for Card 2', 'Item 2 for Card 2'],
      ['Item 1 for Card 3', 'Item 2 for Card 3', 'Item 3 for Card 3'],
      // ['Item 1 for Card 4', 'Item 2 for Card 4', 'Item 4 for Card 4'],
      // ['Item 1 for Card 5', 'Item 2 for Card 5', 'Item 5 for Card 5'],
      // ['Item 1 for Card 6', 'Item 2 for Card 6', 'Item 6 for Card 6'],
      // ['Item 1 for Card 7', 'Item 2 for Card 7', 'Item 7 for Card 7'],
      // ['Item 1 for Card 8', 'Item 2 for Card 8', 'Item 8 for Card 8'],
      // ['Item 1 for Card 9', 'Item 2 for Card 9', 'Item 9 for Card 9'],
      // Add content for all cards
    ];

    // Check if the selected index is within bounds
    if (selectedCardIndex < 0 || selectedCardIndex >= cardItems.length) {
      return Center(
        child: Text(
          'No items available',
          style: TextStyle(fontFamily: 'GlacialIndifference-Bold'),
        ),
      );
    }

    return ListView.builder(
      itemCount: cardItems[selectedCardIndex].length, // Number of items in the selected card
      itemBuilder: (context, index) {
        return TaskItem(
          title: 'Task ${index + 1}',
          subtitle: cardItems[selectedCardIndex][index],
          date: 'Today',
          index: index, // Pass the index for identification
          onEditPressed: onEditPressed, // Pass the edit callback
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: VerticalCardList(
        selectedCardIndex: 0,
        onEditPressed: () {
          // Handle edit pressed
        },
      ),
      backgroundColor: Colors.white, // Set the background color to white
    ),
  ));
}
