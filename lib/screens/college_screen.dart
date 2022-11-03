import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/screens/about_us_screen.dart';
import 'package:youthopia_2022_app/screens/signup_screen.dart';
import '../constants/color_theme.dart';
import '../constants/gradient_color.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        const Positioned.fill(
            child: Image(
          image: AssetImage(
            'assets/background_image.png',
          ),
          color: Color.fromARGB(84, 0, 0, 0),
          colorBlendMode: BlendMode.darken,
          fit: BoxFit.fill,
        )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 50,
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.maxFinite,
              ),
              const Image(
                image: AssetImage(
                  'assets/youthopiaIcon.png',
                ),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: GradientText(
                    'Are you from ',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SignUp(true)),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(ColourTheme.blue),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            ColourTheme.white)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "DIT University",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'OR',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColourTheme.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SignUp(false)),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(ColourTheme.blue),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            ColourTheme.white)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "Other College",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const AboutUsScreen()));
                    },
                    child: GradientText(
                      'About Us',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'IBM Plex',
                          fontWeight: FontWeight.bold,
                          color: ColourTheme.secondary),
                    ),
                  ),
                ),
              )),
            ],
          ),
        )
      ]),
    );
  }
}
