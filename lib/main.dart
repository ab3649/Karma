import 'package:flutter/material.dart';
import 'package:karma/Onboarding/signup_page.dart';
import 'package:karma/Signup_Login/login_page.dart';
import 'package:karma/Task_Management/taskScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TaskScreen(), //test task screen
      home: SignUpPage(),  //test signup screen
      // home: LogInPage(),  //test login screen

    );
  }
}
