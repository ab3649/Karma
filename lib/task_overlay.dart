import 'package:flutter/material.dart';

class TaskOverlay extends StatefulWidget {
  @override
  _TaskOverlayState createState() => _TaskOverlayState();
}

class _TaskOverlayState extends State<TaskOverlay> {
  final TextEditingController _taskController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

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
                                // Handle dropdown selection
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Option 1',
                                  child: Text('earn'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Option 2',
                                  child: Text('get rich'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Option 3',
                                  child: Text('sleep'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.blue),
                        onPressed: () {
                          // Handle submit task
                        },
                      ),
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
