import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/color_theme.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              child: const Image(
                image: AssetImage('assets/inbg.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const Text(
          'Oops! No Connection',
          style: TextStyle(
              color: Colors.white, fontFamily: 'IBM Plex Sans', fontSize: 28),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Text(
          'No internet connection found. Check\n \t\t\t\t\t your connection or try again.',
          style: TextStyle(
              color: Colors.white, fontFamily: 'IBM Plex Sans', fontSize: 14),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.087,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextButton(
              onPressed: null,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF191919),
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColourTheme.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    const Icon(FontAwesomeIcons.rotateRight),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    const Text(
                      "Try again",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
