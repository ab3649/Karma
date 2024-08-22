import 'package:flutter/material.dart';
import 'package:karma/Task_Management/bottom_navigation_with_pointer.dart';
import 'package:karma/Task_Management/goals_screen.dart';
import 'package:karma/Task_Management/goal_overlay.dart';
import 'package:karma/Task_Management/inbox_screen.dart'; // Import the InboxScreen
import 'package:karma/Task_Management/task_overlay.dart';
import 'package:karma/Task_Management/models.dart'; // Import your Task model
import 'package:karma/Task_Management/today_screen.dart'; // Import the TodayScreen
import 'package:karma/Task_Management/browse_screen.dart'; // Import the BrowseScreen

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _selectedCardIndex = 0;
  int _selectedIndex = 0;
  List<Task> _tasks = []; // List to store tasks

  final List<String> _cardTitles = [
    'All',
    'Some',
    'Many',
    'A lot',
    'Much much more',
  ];

  final List<GlobalKey> _navBarItemKeys = List.generate(4, (index) => GlobalKey()); // Adjusted to 4 items

  Offset _pointerPosition = Offset.zero;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updatePointerPosition();
    });
  }

  void _updatePointerPosition() {
    RenderBox? renderBox = _navBarItemKeys[_selectedIndex].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      Offset offset = renderBox.localToGlobal(Offset.zero);
      setState(() {
        _pointerPosition = Offset(
          offset.dx + renderBox.size.width / 2 - 10,
          MediaQuery.of(context).size.height - 10,
        );
      });
    }
  }

  void _showOverlay() {
    if (_selectedIndex == 2) {
      // Show goal overlay when on Goals screen
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => GoalOverlay(),
      );
    } else if (_selectedIndex == 0) {
      // Show task overlay when on task screens
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => TaskOverlay(onTaskCreated: (Task) {},),
      ).then((_) {
        setState(() {
          // Example: refresh the task list
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updatePointerPosition();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _selectedIndex == 0
            ? InboxScreen(
          cardTitles: _cardTitles,
          selectedCardIndex: _selectedCardIndex,
          onCardTap: (index) {
            setState(() {
              _selectedCardIndex = index;
            });
          },
          onEditPressed: _showOverlay,
        )
            : _selectedIndex == 1
            ? TodayScreen()  // Show the Today screen if the 'Today' button is selected
            : _selectedIndex == 2
            ? GoalsScreen()  // Show the Goals screen if the 'Goals' button is selected
            : BrowseScreen(), // Show the Browse screen if the 'Browse' button is selected
      ),
      bottomNavigationBar: BottomNavigationWithPointer(
        selectedIndex: _selectedIndex,
        navBarItemKeys: _navBarItemKeys,
        pointerPosition: _pointerPosition,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1D5EBE),
        onPressed: _showOverlay,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        mini: true,
        elevation: 0,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TaskScreen(),
  ));
}
