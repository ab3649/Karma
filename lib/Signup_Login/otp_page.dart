import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  bool _otpIsValid = true; // Track OTP validation

  void _validateOtp() {
    setState(() {
      // Example validation: all fields must be filled, and you can add specific OTP logic here
      _otpIsValid = _otpControllers.every((controller) => controller.text.isNotEmpty);
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
                      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                      children: [
                        Row(
                          children: [
                            Text(
                              "Enter your ",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'GlacialIndifference',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'OTP.',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'GlacialIndifference',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "We need to verify it's you! Please enter the one-time\npassword that was sent to your e-mail...",
                          style: TextStyle(color: Color(0xFF666666), fontSize: 16, fontFamily: 'GlacialIndifference'),
                        ),
                        SizedBox(height: 20), // Space between the title and input field
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (index) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: 45,
                                  height: 50,
                                  child: TextField(
                                    controller: _otpControllers[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1, // Limit input to a single character
                                    onChanged: (value) {
                                      if (value.length == 1 && index < 5) {
                                        FocusScope.of(context).nextFocus(); // Move to the next field
                                      } else if (value.isEmpty && index > 0) {
                                        FocusScope.of(context).previousFocus(); // Move to the previous field if the current one is empty
                                      }
                                    },
                                    decoration: InputDecoration(
                                      counterText: "", // Hide the character counter
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                                        borderSide: BorderSide(color: _otpIsValid ? Colors.grey : Colors.red), // Change border color based on validation
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: _otpIsValid ? Colors.grey : Colors.red), // Grey outline when focused
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: _otpIsValid ? Colors.grey : Colors.red), // Grey outline when enabled
                                      ),
                                    ),
                                  ),
                                ),
                                if (index < 5) SizedBox(width: 20), // Add space between the blocks except after the last one
                              ],
                            );
                          }),
                        ),
                        if (!_otpIsValid) // Show error message if OTP is invalid
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "You’ve entered the incorrect OTP, try again!",
                              style: TextStyle(color: Colors.red, fontFamily: 'GlacialIndifference'),
                            ),
                          ),
                        SizedBox(height: 20), // Space between input field and button
                        OutlinedButton(
                          onPressed: () {
                            _validateOtp(); // Validate OTP when button is pressed
                          },
                          child: Text('Verify OTP', style: TextStyle(color: Colors.white, fontFamily: 'GlacialIndifference-bold')), // Button text color
                          style: OutlinedButton.styleFrom(
                            backgroundColor: _otpIsValid ? Color(0xFF1D5EBE) : Colors.grey, // Change button color based on validation
                            minimumSize: Size(double.infinity, 48),
                            side: BorderSide(color: Colors.grey, width: 1), // Grey border color and width
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            ),
                            elevation: 0, // Remove elevation
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Didn\'t receive an OTP? ', style: TextStyle(color: Colors.black, fontFamily: 'GlacialIndifference')),
                            TextButton(
                              onPressed: () {
                                // Implement resend OTP logic here
                              },
                              child: Text('Resend OTP', style: TextStyle(color: Colors.black, fontFamily: 'GlacialIndifference-bold')),
                            ),
                          ],
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
