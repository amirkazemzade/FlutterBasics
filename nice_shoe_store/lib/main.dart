import 'package:flutter/material.dart';
import 'package:nike_shoe_store/screen/app_routes.dart';
import 'package:nike_shoe_store/screen/home_page.dart';
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
      initialRoute: AppRoutes.login,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.login:
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case AppRoutes.signUp:
            return MaterialPageRoute(builder: (context) => const SignUp());
          case AppRoutes.profile:
            return MaterialPageRoute(builder: (context) => const ProfilePage());
        }
      },
      home: const LoginPage(),
    );
  }
}
