import 'package:flutter/material.dart';
import 'package:nike_shoe_store/navigation/app_routes.dart';
import 'package:nike_shoe_store/screen/login/login_page.dart';
import 'package:nike_shoe_store/screen/profile/profile_page.dart';
import 'package:nike_shoe_store/screen/sign_up/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signUp: (context) => const SignUp(),
        AppRoutes.profile: (context) => const ProfilePage()
      },
      home: const LoginPage(),
    );
  }
}
