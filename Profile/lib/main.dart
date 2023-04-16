import 'package:flutter/material.dart';

import 'constants.dart';

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
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "پروفایل",
          style: TextStyle(color: darkGrayColor, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: lightGrayColor,
        elevation: 0,
      ),
      body: Container(
        color: lightGrayColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              UserInfo(),
              ActionTile(
                title: "لیست علاقمندی ها",
                icon: Icon(Icons.favorite_border),
              ),
              ActionTile(
                title: "سوابق سفارش ها",
                icon: Icon(Icons.shopping_basket_outlined),
              ),
              ActionTile(
                title: "خروج از حساب کاربری",
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.chevron_left),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(
            "test@gmail.com",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
              color: lightBlueColor,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: const Icon(
            Icons.person,
            size: 70,
            color: darkBlueColor,
          ),
        ),
      ],
    );
  }
}
