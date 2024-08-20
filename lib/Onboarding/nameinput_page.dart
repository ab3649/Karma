import 'package:flutter/material.dart';

class NameInputPage extends StatefulWidget {
  @override
  _NameInputPageState createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/Vector (Stroke).png', color: Colors.black),
          onPressed: () {
            // Implement back navigation here
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/Vector.png', color: Colors.black),
            onPressed: () {
              // Implement your settings navigation here
            },
          ),
        ],
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0, // Remove shadow for a flat look
      ),
      body: Container(
        color: Color(0xFFFFFFFF), // Set background color to white
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
                children: [
                  // SizedBox(height: 100), // Space after the AppBar
                  Row(
                    children: [
                      Text(
                        "What's your ",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'GlacialIndifference',
                          color: Colors.black,
                          fontWeight: FontWeight.normal, // Normal weight for "What's your"
                        ),
                      ),
                      Text(
                        'name?',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'GlacialIndifference',
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold weight for "name?"
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Space between the title and input field
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Name',
                      hintStyle: TextStyle(fontFamily: 'GlacialIndifference', color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        borderSide: BorderSide(color: Colors.grey), // Grey outline
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey), // Grey outline when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey), // Grey outline when enabled
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Control height with vertical padding
                    ),
                  ),
                  SizedBox(height: 14), // Space between input field and button
                  OutlinedButton(
                    onPressed: () {
                      // Implement proceed logic here
                    },
                    child: Text('Proceed', style: TextStyle(color: Colors.white, fontFamily: 'GlacialIndifference-bold')), // Proceed text color
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF1D5EBE), // Button background color
                      minimumSize: Size(double.infinity, 48),
                      side: BorderSide(color: Colors.grey, width: 1), // Grey border color and width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                      elevation: 0, // Remove elevation
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
