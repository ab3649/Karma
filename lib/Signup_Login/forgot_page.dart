import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _emailIsValid = true; // Track email validation

  void _validateEmail() {
    setState(() {
      // Example validation: email should contain '@' and '.'
      _emailIsValid = _emailController.text.contains('@') && _emailController.text.contains('.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/Vector (Stroke).png', color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Implement back navigation
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
                      children: [
                        Row(
                          children: [
                            Text(
                              "Forgot ",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'GlacialIndifference',
                                color: Colors.black,
                                fontWeight: FontWeight.bold, // Normal weight for "What's your"
                              ),
                            ),
                            Text(
                              'your password?',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'GlacialIndifference',
                                color: Colors.black,
                                fontWeight: FontWeight.normal, // Bold weight for "name?"
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Don’t worry it happens to the best of us. We’ll send you a reset link on your E-Mail address.",
                          style: TextStyle(color: Color(0xFF666666), fontSize: 16, fontFamily: 'GlacialIndifference'),
                        ),
                        SizedBox(height: 10), // Space between the title and input field
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your E-Mail Address',
                            hintStyle: TextStyle(fontFamily: 'GlacialIndifference', color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0), // Rounded corners
                              borderSide: BorderSide(color: _emailIsValid ? Colors.grey : Colors.red), // Change border color based on validation
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: _emailIsValid ? Colors.grey : Colors.red), // Grey outline when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: _emailIsValid ? Colors.grey : Colors.red), // Grey outline when enabled
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Control height with vertical padding
                          ),
                        ),
                        if (!_emailIsValid) // Show error message if email is invalid
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "The E-Mail Address doesn’t exist in our database!",
                              style: TextStyle(color: Colors.red, fontFamily: 'GlacialIndifference'),
                            ),
                          ),
                        SizedBox(height: 14), // Space between input field and button
                        OutlinedButton(
                          onPressed: () {
                            _validateEmail(); // Validate email when button is pressed
                          },
                          child: Text('Generate OTP', style: TextStyle(color: Colors.white, fontFamily: 'GlacialIndifference-bold')), // Proceed text color
                          style: OutlinedButton.styleFrom(
                            backgroundColor: _emailIsValid ? Color(0xFF1D5EBE) : Colors.grey, // Change button color based on validation
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?", style: TextStyle(fontFamily: 'GlacialIndifference')),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-up page
                      },
                      child: Text('Create One here.', style: TextStyle(color: Colors.black, fontFamily: 'GlacialIndifference-bold')),
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
