import 'package:flutter/material.dart';
import 'package:karma/Task_Management/navigation_pointer_painter.dart';

class BottomNavigationWithPointer extends StatelessWidget {
  final int selectedIndex;
  final List<GlobalKey> navBarItemKeys;
  final Offset pointerPosition;
  final Function(int) onItemTapped;

  BottomNavigationWithPointer({
    required this.selectedIndex,
    required this.navBarItemKeys,
    required this.pointerPosition,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 80, // Set the desired height here
          color: Colors.grey[300], // Background color of the BottomNavigationBar
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent, // Make the BottomNavigationBar's canvas transparent
              primaryColor: Colors.black, // Sets the active color of the BottomNavigationBar
              textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.black), // Sets the inactive color
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0, // Remove default shadow
              currentIndex: selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'GlacialIndifference',
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'GlacialIndifference',
              ),
              onTap: onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/Inbox Line.png', key: navBarItemKeys[0]),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/Calendar Minimalistic.png', key: navBarItemKeys[1]),
                  label: 'Today',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/Target.png', key: navBarItemKeys[2]),
                  label: 'Goals',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/Sort.png', key: navBarItemKeys[3]),
                  label: 'Browse',
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0, // Adjust to ensure the pointer is aligned correctly
          left: pointerPosition.dx,
          child: CustomPaint(
            painter: NavigationPointerPainter(),
            child: Container(
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
