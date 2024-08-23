import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // Implement your reset password logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('karma'),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/Settings.png', color: Colors.black),
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
        color: Color(0xFFFFFFFF), // Set background color to white
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey, // Assign form key
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Reset your ',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'GlacialIndifference',
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'password!',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'GlacialIndifference-bold',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold, // Bold weight for "name?"
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'It’s okay to forget your password, we make sure that you get it back!',
                            style: TextStyle(color: Color(0xFF666666), fontSize: 16, fontFamily: 'GlacialIndifference'),
                          ),
                          SizedBox(height: 14),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Enter your new Password',
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your new password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirm your new Password',
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'The passwords don’t match! Try again.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 14),
                          OutlinedButton(
                            onPressed: _resetPassword,
                            child: Text('Reset Password', style: TextStyle(color: Colors.white, fontFamily: 'GlacialIndifference-bold')), // Sign-in text color
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
