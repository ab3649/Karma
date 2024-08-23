import 'package:flutter/material.dart';
import 'package:karma/Onboarding/goalinput_page.dart';
import 'package:karma/Onboarding/nameinput_page.dart';
import 'package:karma/Onboarding/signup_page.dart';
import 'package:karma/Onboarding/taskinput_page.dart';
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
      // home: TaskScreen(), //test task screen
      // home: SignUpPage(),  //test signup screen
      home: LogInPage(),  //test login screen
      // home: NameInputPage(),
      // home: GoalInputPage(),
      // home: TaskInputPage(),
      // home: ForgotPage(),
      // home: OtpPage(),
      // home: ResetPage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:karma/Onboarding/goalinput_page.dart';
// import 'package:karma/Onboarding/nameinput_page.dart';
// import 'package:karma/Onboarding/signup_page.dart';
// import 'package:karma/Onboarding/taskinput_page.dart';
// import 'package:karma/Signup_Login/forgot_page.dart';
// import 'package:karma/Signup_Login/login_page.dart';
// import 'package:karma/Signup_Login/otp_page.dart';
// import 'package:karma/Signup_Login/reset_page.dart';
// import 'package:karma/Task_Management/taskScreen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   bool firstLaunch = await checkFirstLaunch();
//
//   runApp(MyApp(firstLaunch: firstLaunch));
// }
//
// Future<bool> checkFirstLaunch() async {
//   final prefs = await SharedPreferences.getInstance();
//   final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
//
//   if (isFirstLaunch) {
//     await prefs.setBool('isFirstLaunch', false);
//   }
//
//   return isFirstLaunch;
// }
//
// class MyApp extends StatelessWidget {
//   final bool firstLaunch;
//
//   const MyApp({super.key, required this.firstLaunch});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Karma App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: firstLaunch ? SignUpPage() : LogInPage(), // Use TaskScreen for subsequent launches
//       // You can replace TaskScreen with LoginPage() if you want to show the login page after sign up
//     );
//   }
// }
