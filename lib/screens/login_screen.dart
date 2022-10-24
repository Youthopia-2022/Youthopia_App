import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/about_us_screen.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';
import 'package:youthopia_2022_app/screens/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';

import '../widgets/snack_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  bool _redirecting = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState(){
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const NavBarScreen()),
              (Route<dynamic> route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.background,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 800,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ShaderMask(
                                shaderCallback: (Rect rect) {
                                  return ColourTheme.primaryGradient
                                      .createShader(rect);
                                },
                                child: Text(
                                  "Welcome back to Youthopia !",
                                  style: TextStyle(
                                      color: ColourTheme.white,
                                      fontSize: 30,
                                      fontFamily: 'IBM Plex'),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, right: 10),
                              child: const Image(
                                  image: AssetImage('assets/youthopia_face.png'),
                                  color: Color.fromRGBO(255, 255, 255, 0.15),
                                  colorBlendMode: BlendMode.modulate),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 8),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                if (EmailValidator.validate(value!)) {
                                  return null;
                                } else {
                                  return 'Enter valid Email';
                                }
                              },
                              onChanged: (String value) {
                                _email = value;
                              },
                              style: TextStyle(
                                  fontSize: 20, color: ColourTheme.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColourTheme.grey)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: ColourTheme.pink),
                                  ),
                                  hintText: "Email",
                                  icon: Icon(
                                    Icons.mail_outline,
                                    color: ColourTheme.lightGrey,
                                  ),
                                  hintStyle: TextStyle(
                                    color: ColourTheme.lightGrey,
                                  )),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (String? value) {
                              if (value!.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              _password = value;
                            },
                            style: TextStyle(
                                fontSize: 20, color: ColourTheme.white),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColourTheme.grey)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColourTheme.pink)),
                                hintText: "Password",
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: ColourTheme.lightGrey,
                                ),
                                hintStyle: TextStyle(
                                  color: ColourTheme.lightGrey,
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const NavBarScreen()));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: ColourTheme.secondary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: TextButton(
                            onPressed: () async {
                              _formKey.currentState!.validate();
                              try {
                                await Supabase.instance.client.auth
                                    .signInWithPassword(
                                  email: _email,
                                  password: _password,);
                              } on AuthException catch(error) {
                                debugPrint(error.message.toString());

                                if(error.message == "Invalid login credentials") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                      snackBarLoginInvalidCredentials)
                                      .toString();
                                }
                                if(error.message == "Email not confirmed") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarLoginEmailNotConfirm)
                                      .toString();
                                }
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40))),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    ColourTheme.blue),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    ColourTheme.white)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontFamily: 'IBM Plex',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: ColourTheme.lightGrey,
                                      fontSize: 18,
                                      fontFamily: 'IBM Plex'),
                                  text: "Don't have an account yet ? "),
                              TextSpan(
                                  style: TextStyle(
                                      color: ColourTheme.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IBM Plex'),
                                  text: "Sign up",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SignUp()),
                                        (Route<dynamic> route) => false,
                                      );
                                    }),
                            ]),
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
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AboutUsScreen()));
                              },
                              child: Text(
                                'About Us',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'IBM Plex',
                                    fontWeight: FontWeight.bold,
                                    color: ColourTheme.secondary),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
