import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/screens/see_more_screen.dart';
import 'package:youthopia_2022_app/services/events.dart';

import '../constants/color_theme.dart';
import '../constants/gradient_color.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //toolbarHeight: 70,
          automaticallyImplyLeading: false,
          leadingWidth: double.maxFinite,
          title: const GradientText(
            'Event Categories',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 24,
            ),
          ),
          backgroundColor: const Color(0xFF0F0F0F),
        ),
        backgroundColor: ColourTheme.black,
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            SeeMoreScreen(Event.techEvents!)));
              },
              child: Center(
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/technical.png'),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Technical',
                        style: TextStyle(
                            color: ColourTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            SeeMoreScreen(Event.culturalEvents!)));
              },
              child: Center(
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/cultural.png'),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Cultural',
                        style: TextStyle(
                            color: ColourTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            SeeMoreScreen(Event.informalEvents!)));
              },
              child: Center(
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/informal.png'),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Informal',
                        style: TextStyle(
                            color: ColourTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            SeeMoreScreen(Event.debateEvents!)));
              },
              child: Center(
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/literary.png'),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Literary',
                        style: TextStyle(
                            color: ColourTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            SeeMoreScreen(Event.artsEvents!)));
              },
              child: Center(
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/fine_arts.png'),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Fine Arts',
                        style: TextStyle(
                            color: ColourTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
