import 'package:flutter/material.dart';

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
      ['Item 1 for Card 0', 'Item 2 for Card 0', 'Item 3 for Card 0'],
      ['Item 1 for Card 1', 'Item 2 for Card 1', 'Item 3 for Card 1'],
      ['Item 1 for Card 2', 'Item 2 for Card 2', 'Item 3 for Card 2'],
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

class TaskItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;
  final int index;
  final VoidCallback onEditPressed;

  TaskItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.index,
    required this.onEditPressed,
  });

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool showEditDelete = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showEditDelete = !showEditDelete;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Circle at the left
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 8), // Space between circle and text
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'GlacialIndifference',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Space between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'GlacialIndifference',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.date,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'GlacialIndifference',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              right: showEditDelete ? 0 : -100,
              top: 0,
              bottom: 0,
              child: Container(
                width: 100,
                color: Colors.red,
                child: Row(
                  children: [
                    // Red section
                    Container(
                      color: Color(0xFF1D5EBE),
                      width: 50,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            // icon: Icon(Icons.edit, color: Colors.white),
                            icon: Image.asset('assets/icons/Magic Stick 3.png'), // Use the custom image here
                            onPressed: widget.onEditPressed,
                          ),
                        ],
                      ),
                    ),
                    // Blue section
                    Container(
                      color: Color(0xFF4C4C),
                      width: 50,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            // icon: Icon(Icons.delete, color: Colors.white),
                            icon: Image.asset('assets/icons/Trash Bin Minimalistic.png'), // Use the custom image here
                            onPressed: () {
                              print('Delete button pressed for item: ${widget.index}');
                              print('Title: ${widget.title}');
                              print('Subtitle: ${widget.subtitle}');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
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
