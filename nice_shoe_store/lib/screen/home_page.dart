import 'package:flutter/material.dart';
import 'package:nike_shoe_store/screen/dashboard/dashboard.dart';
import 'package:nike_shoe_store/screen/orders/orders.dart';
import 'package:nike_shoe_store/screen/profile/profile_page.dart';
import 'package:nike_shoe_store/widget/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        onChangeIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Builder(
        builder: (context) {
          switch (currentIndex) {
            case 2:
              return const DashboardPage();
            case 1:
              return const OrdersPage();
            case 0:
              return const ProfilePage();
          }
          return Container();
        },
      ),
    );
  }
}
