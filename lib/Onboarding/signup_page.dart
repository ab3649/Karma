import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('karma'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implement your settings navigation here
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0, // Remove shadow for a flat look
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100), // Add space after the AppBar to match the login page
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome to ',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'GlacialIndifference',
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'karma!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'GlacialIndifference-bold',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'A productivity tool to manage your goals. Create your account to begin your journey!',
                        style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'GlacialIndifference'),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Enter your E-Mail Address',
                          labelStyle: TextStyle(fontFamily: 'GlacialIndifference', color: Colors.black),
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
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey), // Grey outline when disabled
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Control height with vertical padding
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Enter your Password',
                          labelStyle: TextStyle(fontFamily: 'GlacialIndifference', color: Colors.black),
                          suffixIcon: Icon(Icons.visibility), // Show/hide password icon
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
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey), // Grey outline when disabled
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Control height with vertical padding
                        ),
                        obscureText: true, // Mask password input
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm your Password',
                          labelStyle: TextStyle(fontFamily: 'GlacialIndifference', color: Colors.black),
                          suffixIcon: Icon(Icons.visibility), // Show/hide password icon
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
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey), // Grey outline when disabled
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Control height with vertical padding
                        ),
                        obscureText: true, // Mask password input
                      ),
                      SizedBox(height: 14),
                      OutlinedButton(
                        onPressed: () {
                          // Implement account creation logic here
                        },
                        child: Text('Create Account', style: TextStyle(color: Colors.white, fontFamily: 'GlacialIndifference-bold')), // Sign-in text color
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
                      SizedBox(height: 32),
                    ],
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
                    Text("Already have an account?", style: TextStyle(fontFamily: 'GlacialIndifference')),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-in page
                      },
                      child: Text('Sign In', style: TextStyle(color: Colors.black, fontFamily: 'GlacialIndifference-bold')),
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
