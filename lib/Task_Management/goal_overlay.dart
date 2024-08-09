import 'package:flutter/material.dart';

class GoalOverlay extends StatefulWidget {
  @override
  _GoalOverlayState createState() => _GoalOverlayState();
}

class _GoalOverlayState extends State<GoalOverlay> {
  final TextEditingController _goalController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? _selectedPriority; // Variable to store the selected priority

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (!_focusNode.hasFocus) {
              Navigator.of(context).pop(); // Close the overlay when tapped outside
            }
          },
          child: Container(
            color: Colors.black54, // Semi-transparent background
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _goalController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      labelText: 'e.g., Complete Flutter project by end of month',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Goal Description',
                    style: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton.icon(
                    icon: Icon(Icons.date_range, color: Colors.grey),
                    label: Text(
                      'Due On',
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference',
                        fontSize: 16,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Handle Due On button
                    },
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Priority',
                        style: TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 16,
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedPriority,
                        hint: Text('Select priority'),
                        items: <String>['High', 'Medium', 'Low'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPriority = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Completion Percentage',
                        style: TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 16,
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedPriority, // Use this for demonstration, or create another variable
                        hint: Text('Select %'),
                        items: <String>['0%', '25%', '50%', '75%', '100%'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPriority = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: Material(
                          color: Color(0xFF1D5EBE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.check, color: Colors.white),
                            onPressed: () {
                              // Handle submit goal
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
