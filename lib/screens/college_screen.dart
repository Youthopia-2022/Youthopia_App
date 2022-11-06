import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youthopia_2022_app/screens/signup_screen.dart';

import '../widgets/gradient_button.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        const Positioned.fill(
            child: Image(
          image: AssetImage(
            'assets/homescreenbg.png',
          ),
          color: Color.fromARGB(84, 0, 0, 0),
          colorBlendMode: BlendMode.darken,
          fit: BoxFit.fill,
        )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.maxFinite,
              ),
              const Image(
                image: AssetImage(
                  'assets/y3.png',
                ),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Image(
                image: AssetImage('assets/clgscreenlogo.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const Text(
                'Who are you ?',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              GradientButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SignUp(true),
                    ),
                  );
                },
                height: 50,
                width: MediaQuery.of(context).size.width * 0.75,
                text: "DIT Student",
                titleStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: "IBM Plex Sans",
                    color: Colors.white),
                textColor: Colors.black87,
                icon: (FontAwesomeIcons.arrowRight),
                iconColor: const Color.fromARGB(255, 255, 255, 255),
                gradientColor1: const Color(0xFFF7797D),
                gradientColor2: const Color(0xFFC471ED),
                gradientColor3: const Color(0xFF12C2E9),
                hoverElv: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SignUp(false),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFF7797D),
                      Color(0xFFC471ED),
                      Color(0xFF12C2E9)
                    ]),
                    
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/bgofbtn.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                            color: const Color.fromARGB(0, 255, 255, 255)),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Outsider\t \t \t \t \t \t",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'IBM Plex Sans',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
