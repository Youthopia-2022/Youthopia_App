import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/screens/home_screen.dart';
import 'package:youthopia_2022_app/screens/main_screen.dart';
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
    const MainScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: GNav(
        gap: 10,
        backgroundColor: const Color(0xFF0f0f0f),
        hoverColor: const Color(0xFF222222),
        haptic: true,
        tabBorderRadius: 15,
        curve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 100),
        color: ColourTheme.white,
        activeColor: ColourTheme.pink,
        iconSize: 25,
        tabBackgroundColor: const Color(0xFF222222),
        tabMargin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 15), // tab button border
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        tabs: const [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.dataset, text: "Category"),
          GButton(icon: Icons.settings, text: "Settings"),
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
