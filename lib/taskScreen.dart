import 'package:flutter/material.dart';
import 'package:karma/horizontal_card_list.dart';
import 'task_overlay.dart';
import 'verticle_card_list_2.dart';
import 'bottom_navigation_with_pointer.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _selectedCardIndex = 0;
  int _selectedIndex = 1;

  final List<String> _cardTitles = [
    'All',
    'Some',
    'Many',
    'A lot',
    'much much more',
  ];

  final List<GlobalKey> _navBarItemKeys = List.generate(4, (index) => GlobalKey());

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

  void _showTaskOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TaskOverlay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updatePointerPosition();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Liam!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, fontFamily: 'GlacialIndifference'),
              ),
              SizedBox(height: 8),
              Text(
                'Below is a summary of all actions that need attention today!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'GlacialIndifference'),
              ),
              SizedBox(height: 16),
              ScrollableCardList(
                selectedCardIndex: _selectedCardIndex,
                cardTitles: _cardTitles,
                onCardTap: (index) {
                  setState(() {
                    _selectedCardIndex = index;
                  });
                },
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: VerticalCardList(
                    selectedCardIndex: _selectedCardIndex,
                    onEditPressed: _showTaskOverlay, // Pass the overlay function
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWithPointer(
        selectedIndex: _selectedIndex,
        navBarItemKeys: _navBarItemKeys,
        pointerPosition: _pointerPosition,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1D5EBE),
        onPressed: _showTaskOverlay,
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
