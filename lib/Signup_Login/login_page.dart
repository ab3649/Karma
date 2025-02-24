import 'package:flutter/material.dart';
import 'package:karma/Onboarding/signup_page.dart';
import 'package:karma/Signup_Login/forgot_page.dart';
import 'package:karma/Task_Management/taskScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String clientId = 'YOUR_CLIENT_ID';
  final String clientSecret = 'YOUR_CLIENT_SECRET';
  final String redirectUri = 'YOUR_REDIRECT_URI';
  final String scopes = 'email profile';

  Future<void> _signInWithGoogle() async {
    try {
      final Uri authUrl = Uri.parse(
          'https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=$clientId&redirect_uri=$redirectUri&scope=$scopes'
      );

      // Open the URL in the browser
      await launch(authUrl.toString());

      // After the user has signed in and granted access, they will be redirected to your redirect URI
      // Handle the redirect URI and extract the authorization code
      // For simplicity, we'll skip the actual implementation of extracting the authorization code here

      final authorizationCode = 'AUTHORIZATION_CODE_FROM_REDIRECT';

      final response = await http.post(
        Uri.parse('https://oauth2.googleapis.com/token'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'code': authorizationCode,
          'client_id': clientId,
          'client_secret': clientSecret,
          'redirect_uri': redirectUri,
          'grant_type': 'authorization_code',
        },
      );

      final responseBody = jsonDecode(response.body);
      final accessToken = responseBody['access_token'];

      // Use the access token to access user information
      final userInfoResponse = await http.get(
        Uri.parse('https://www.googleapis.com/oauth2/v2/userinfo'),
        headers: <String, String>{
          'Authorization': 'Bearer $accessToken',
        },
      );

      final userInfo = jsonDecode(userInfoResponse.body);
      print('User signed in: ${userInfo['email']}');
    } catch (e) {
      print('Error during Google Sign-In: $e');
    }
  }

  void _signInWithEmailAndPassword() async {
    try {
      // Implement your manual sign-in logic here
      print('Email sign-in logic');
    } catch (e) {
      print('Error during Email Sign-In: $e');
    }
  }

  void _forgotPassword() {
    // Implement your forgot password logic here
    print('Forgot Password clicked');
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
        // backgroundColor: Colors.white,
        backgroundColor: Color(0xFFFFFFFF),
        // foregroundColor: Colors.black,
        elevation: 0, // Remove shadow for a flat look
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView( // Wrap with SingleChildScrollView
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) of the column
                      children: [
                        // SizedBox(height: 100), // Add a SizedBox before the "Welcome to karma!" text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Welcome to ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'GlacialIndifference',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'karma!',
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
                        // SizedBox(height: 4),
                        Text(
                          'A productivity tool to manage your goals. Sign in to begin your journey!',
                          style: TextStyle(color: Color(0xFF666666), fontSize: 16, fontFamily: 'GlacialIndifference'),
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
                          obscureText: true,
                        ),
                        // SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (_) {}),
                                Text('Remember me', style: TextStyle(color: Colors.grey, fontFamily: 'GlacialIndifference')),
                              ],
                            ),
                            TextButton(
                              // onPressed: _forgotPassword,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ForgotPage()),
                                );
                              },
                              child: Text('Forgot Password?', style: TextStyle(color: Colors.grey, fontFamily: 'GlacialIndifference')),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        OutlinedButton(
                          // onPressed: _signInWithEmailAndPassword,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TaskScreen()),
                            );
                          },
                          child: Text('Sign In', style: TextStyle(color: Colors.white, fontFamily: 'GlacialIndifference-bold')), // Sign-in text color
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
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey, // Change divider color to grey
                                thickness: 1, // Adjust the thickness as needed
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'or',
                              style: TextStyle(fontSize: 16), // Adjust the text style as needed
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Divider(
                                color: Colors.grey, // Change divider color to grey
                                thickness: 1, // Adjust the thickness as needed
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: _signInWithGoogle,
                          icon: Image.asset('assets/icons/google.png', height: 30),
                          label: Text('Sign in using Google', style: TextStyle(color: Colors.black, fontFamily: 'GlacialIndifference-bold')),
                          style: OutlinedButton.styleFrom(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?", style: TextStyle(fontFamily: 'GlacialIndifference'),),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-up page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                      },
                      child: Text('Create One here.', style: TextStyle(color: Colors.black, fontFamily: 'GlacialIndifference-bold'),),
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
