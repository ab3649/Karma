import 'package:flutter/material.dart';

class VerticalCardList extends StatelessWidget {
  final int selectedCardIndex;

  VerticalCardList({required this.selectedCardIndex});

  @override
  Widget build(BuildContext context) {
    // Define content for each card
    final List<List<String>> cardItems = [
      ['Item 1 for Card 0', 'Item 2 for Card 0', 'Item 3 for Card 0'],
      ['Item 1 for Card 1', 'Item 2 for Card 1', 'Item 3 for Card 1'],
      ['Item 1 for Card 2', 'Item 2 for Card 2', 'Item 3 for Card 2'],
      // Add content for all cards
    ];

    // Check if the selected index is within bounds
    if (selectedCardIndex < 0 || selectedCardIndex >= cardItems.length) {
      return Center(child: Text('No items available', style: TextStyle(fontFamily: 'GlacialIndifference'),));
    }

    return ListView.builder(
      itemCount: cardItems[selectedCardIndex].length, // Number of items in the selected card
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color to white
            border: Border.all(color: Colors.grey[300]!, width: 1), // Add an outline with a grey color
            borderRadius: BorderRadius.circular(4), // Optional: add rounded corners
          ),
          child: ListTile(
            title: Text(cardItems[selectedCardIndex][index]), // Display items based on selected card
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Details for ${cardItems[selectedCardIndex][index]}', style: TextStyle(fontFamily: 'GlacialIndifference'),),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16),
                    SizedBox(width: 4),
                    Text('Today', style: TextStyle(fontFamily: 'GlacialIndifference'),),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
