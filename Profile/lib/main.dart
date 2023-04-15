import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  var name = "hi";

  var icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "test@gmail.com",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: lightBlueColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: darkBlueColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.chevron_left)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "لیست علاقمندی ها",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.chevron_left)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "سوابق سفارش ها",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.shopping_basket_outlined),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.chevron_left)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "خروج از حساب کاربری",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.exit_to_app),
                        )
                      ],
                    ),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("صفحه اصلی",
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 15,
    //         )),
    //     centerTitle: true,
    //     backgroundColor: Colors.amberAccent,
    //     elevation: 0,
    //   ),
    //   drawer: Drawer(
    //     child: ListView(
    //       children: [
    //         UserAccountsDrawerHeader(
    //             currentAccountPicture: Icon(Icons.person),
    //             accountName: Text("mahsa karimi"),
    //             accountEmail: Text("mah8069sa@gmail.com")),
    //         ListTile(
    //           leading: Icon(Icons.settings),
    //           title: Text("setting"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.person),
    //           title: Text("profile"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.phone),
    //           title: Text("calls"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.phone),
    //           title: Text("calls"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.phone),
    //           title: Text("calls"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.phone),
    //           title: Text("calls"),
    //         )
    //       ],
    //     ),
    //   ),
    //   endDrawer: Drawer(
    //     child: ListView(
    //       children: [
    //         UserAccountsDrawerHeader(
    //             currentAccountPicture: Icon(Icons.person),
    //             accountName: Text("mahsa karimi"),
    //             accountEmail: Text("mah8069sa@gmail.com")),
    //         ListTile(
    //           leading: Icon(Icons.settings),
    //           title: Text("setting"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.person),
    //           title: Text("profile"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.phone),
    //           title: Text("calls"),
    //         )
    //       ],
    //     ),
    //   ),
    //   bottomNavigationBar: SalomonBottomBar(
    //     currentIndex: index,
    //     onTap: (i) => setState(() => index = i),
    //     items: [
    //       /// Home
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text("Home"),
    //         selectedColor: Colors.purple,
    //       ),
    //
    //       /// Likes
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.favorite_border),
    //         title: Text("Likes"),
    //         selectedColor: Colors.pink,
    //       ),
    //
    //       /// Search
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.search),
    //         title: Text("Search"),
    //         selectedColor: Colors.orange,
    //       ),
    //
    //       /// Profile
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.person),
    //         title: Text("Profile"),
    //         selectedColor: Colors.teal,
    //       ),
    //     ],
    //   ),
    //   body: Container(
    //     width: 130,
    //     height: 195,
    //     margin: EdgeInsets.all(20),
    //     decoration:
    //         BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
    //     child: Column(
    //       textDirection: TextDirection.ltr,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Stack(
    //           alignment: Alignment.topRight,
    //           children: [
    //             Container(
    //               width: 130,
    //               height: 140,
    //               decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(20))),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(20),
    //                 child: Image.network(
    //                   "https://s3.ir-thr-at1.arvanstorage.com/nike/zoomx-vaporfly-next-running-shoe-T5qg9m.jpg",
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),
    //             IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     if (icon == Icons.favorite_border)
    //                       icon = Icons.favorite;
    //                     else
    //                       icon = Icons.favorite_border;
    //                   });
    //                 },
    //                 icon: Icon(
    //                   icon,
    //                   color: Colors.blue,
    //                 ))
    //           ],
    //         ),
    //         Text(
    //           "کفش ورزشی مردانه مدل ZoomX",
    //           textAlign: TextAlign.start,
    //           textDirection: TextDirection.rtl,
    //           style: TextStyle(color: Colors.black, fontSize: 10),
    //         ),
    //         Text(
    //           "1,973,000 تومان",
    //           textDirection: TextDirection.rtl,
    //           textAlign: TextAlign.end,
    //           style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 7,
    //               decoration: TextDecoration.lineThrough),
    //         ),
    //         Text(
    //           "1,873,000 تومان",
    //           textDirection: TextDirection.rtl,
    //           textAlign: TextAlign.end,
    //           style: TextStyle(color: Colors.black, fontSize: 9),
    //         )
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       setState(() {
    //         if (name == "hi") name = "hello";
    //         else name="hi";
    //       });
    //     },
    //     child: Text(name),
    //   ),
    // );
  }
}
