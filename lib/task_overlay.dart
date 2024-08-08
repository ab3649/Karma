import 'package:flutter/material.dart';

class TaskOverlay extends StatefulWidget {
  @override
  _TaskOverlayState createState() => _TaskOverlayState();
}

class _TaskOverlayState extends State<TaskOverlay> {
  final TextEditingController _taskController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? _selectedGoal; // Variable to store the selected goal

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
                    controller: _taskController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      labelText: 'eg: urgently complete documentation by Monday',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextButton.icon(
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
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextButton.icon(
                          icon: Icon(Icons.priority_high, color: Colors.grey),
                          label: Text(
                            'Priority',
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
                            // Handle Priority button
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextButton.icon(
                          icon: Icon(Icons.location_on, color: Colors.grey),
                          label: Text(
                            'Location',
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
                            // Handle Location button
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FocusScope(
                        node: FocusScopeNode(), // Create a new FocusScopeNode
                        child: Row(
                          children: [
                            if (_selectedGoal != null) ...[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Adjust padding as needed
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFB265BE), // #B265BE
                                      Color(0xFFB9A0FF), // #B9A0FF
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Adjusts the Row size to fit its children
                                  children: [
                                    // Circle arrow image asset
                                    SizedBox(
                                      width: 20.0, // Set the desired width
                                      height: 20.0, // Set the desired height
                                      child: Image.asset(
                                        'assets/icons/Round Alt Arrow Down.png', // Replace with your image path
                                        color: Colors.white, // Color filter for the image
                                      ),
                                    ),

                                    SizedBox(width: 4.0), // Add some space between the icon and the text

                                    // Text
                                    Text(
                                      _selectedGoal!,
                                      style: TextStyle(
                                        fontFamily: 'GlacialIndifference', // Set font-family
                                        fontSize: 12, // Set font-size to 12px
                                        fontWeight: FontWeight.w700, // Set font-weight to 700
                                        height: 1.2, // Set line-height to 14.4px (12px * 1.2)
                                        color: Colors.white, // Text color remains white
                                      ),
                                      textAlign: TextAlign.left, // Set text alignment to left
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                            Text(
                              'Add to goal',
                              style: TextStyle(
                                fontFamily: 'GlacialIndifference',
                                fontSize: 16,
                              ),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey),
                              elevation: 8,
                              onSelected: (String result) {
                                setState(() {
                                  _selectedGoal = result; // Update the selected goal
                                });
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Learn UI/UX',
                                  child: Text('Learn UI/UX'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'some goal',
                                  child: Text('some goal'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40.0,  // Set the desired width
                        height: 40.0, // Set the desired height
                        child: Material(
                          color: Color(0xFF1D5EBE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                          ),
                          child: IconButton(
                            icon: Image.asset('assets/icons/Plain.png', color: Colors.white),
                            onPressed: () {
                              // Handle submit task
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
