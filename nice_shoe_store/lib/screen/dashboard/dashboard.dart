import 'package:flutter/material.dart';
import 'package:nike_shoe_store/constants.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: lightGrayColor,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // TODO; show filter menu
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: lightBlueColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.filter_list),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: search,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            borderSide:
                                BorderSide(color: darkBlueColor, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
