import 'package:flutter/material.dart';
import 'package:nike_shoe_store/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onChangeIndex,
  });

  final int currentIndex;
  final Function(int) onChangeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            onChangeIndex(index);
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: profile,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_mall_outlined),
              label: orders,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: home,
            ),
          ],
        ),
      ),
    );
  }
}
