import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/screens/category_screen.dart';
import 'package:youthopia_2022_app/screens/main_screen.dart';
import 'package:youthopia_2022_app/screens/profile_screen.dart';
import 'package:youthopia_2022_app/screens/registered_events_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const MainScreen(),
    const CategoryScreen(),
    const RegisteredEvents(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: GNav(
        gap: 5,
        backgroundColor: const Color(0xFF0f0f0f),
        hoverColor: const Color(0xFF222222),
        haptic: true,
        tabBorderRadius: 10,
        curve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 100),
        color: ColourTheme.white,
        activeColor: ColourTheme.pink,
        iconSize: 20,
        tabBackgroundColor: const Color(0xFF222222),
        tabMargin: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 15), // tab button border
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.houseUser,
            text: "Home",
          ),
          GButton(
            icon: FontAwesomeIcons.dice,
            text: " Category",
          ),
          GButton(
            icon: FontAwesomeIcons.calendarCheck,
            text: "Events",
          ),
          GButton(
            icon: FontAwesomeIcons.user,
            text: "Profile",
          ),
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
