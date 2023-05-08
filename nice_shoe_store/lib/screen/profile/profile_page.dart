import 'package:flutter/material.dart';
import 'package:nike_shoe_store/constants.dart';

import 'components/action_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          profile,
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
            children: [
              _userTile(),
              ActionTile(
                context: context,
                title: favoritesList,
                icon: Icons.favorite_border,
              ),
              ActionTile(
                context: context,
                title: ordersHistory,
                icon: Icons.shopping_basket_outlined,
              ),
              ActionTile(
                context: context,
                title: logout,
                icon: Icons.exit_to_app,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _userTile() {
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
