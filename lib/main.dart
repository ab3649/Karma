import 'package:flutter/material.dart';
import 'package:karma/Onboarding/goalinput_page.dart';
import 'package:karma/Onboarding/nameinput_page.dart';
import 'package:karma/Onboarding/signup_page.dart';
import 'package:karma/Onboarding/taskinput_page.daart.dart';
import 'package:karma/Signup_Login/forgot_page.dart';
import 'package:karma/Signup_Login/login_page.dart';
import 'package:karma/Signup_Login/otp_page.dart';
import 'package:karma/Signup_Login/reset_page.dart';
import 'package:karma/Task_Management/taskScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(), //test task screen
      // home: SignUpPage(),  //test signup screen
      // home: LogInPage(),  //test login screen
      // home: NameInputPage(),
      // home: GoalInputPage(),
      // home: TaskInputPage(),
      // home: ForgotPage(),
      // home: OtpPage(),
      // home: ResetPage(),
    );
  }
}
