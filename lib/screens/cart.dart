import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:youthopia_2022_app/screens/home.dart';
import 'package:youthopia_2022_app/screens/profile.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final int _pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text("CART SCREEN")
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.black.withOpacity(.1),
              )
            ]
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.shoppingCart,
                  text: 'My Cart',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                )
              ],
              selectedIndex: _pageIndex,
              onTabChange: (index) {
                (index == 0)?
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())) :
                (index == 2)?
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile())) : "";
              },
            ),
          ),
        ),
      ),
    );
  }
}
