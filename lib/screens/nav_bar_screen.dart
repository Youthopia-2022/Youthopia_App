import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:youthopia_2022_app/screens/home_screen.dart';
import 'package:youthopia_2022_app/screens/profile_screen.dart';

import 'cart_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const Home(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: const Color.fromARGB(255, 36, 38, 41),
        hoverColor: (Colors.grey[700])!,
        haptic: true,
        tabBorderRadius: 15,
        curve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 200),
        color: const Color.fromARGB(255, 223, 215, 215),
        activeColor: const Color.fromARGB(255, 10, 5, 0),
        iconSize: 25,
        tabBackgroundColor: const Color.fromARGB(228, 188, 218, 182),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.houseUser,
            text: "Home",
          ),
          GButton(icon: FontAwesomeIcons.cartShopping, text: "Cart"),
          GButton(icon: FontAwesomeIcons.userCheck, text: "Profile"),
        ],
        selectedIndex: _currentPageIndex,
        onTabChange: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
