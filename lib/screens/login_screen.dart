import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/loading_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';

import '../constants/gradient_color.dart';
import '../widgets/snack_bar.dart';
import 'about_us_screen.dart';
import 'college_screen.dart';

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
  late bool _isPasswordVisible;
  Supa supa = Supa();
  bool isProcessing = false;

  @override
  void initState() {
    supabase.auth.onAuthStateChange.listen((data) async {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const LoadingScreen()),
          (Route<dynamic> route) => false,
        );
      }
    });
    super.initState();
    _isPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "assets/bottomimg.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.999,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Welcome back to ",
                                      style: TextStyle(
                                        color: ColourTheme.white,
                                        fontSize: 30,
                                        fontFamily: 'IBM Plex Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  GradientText(
                                    'Youthopia !',
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
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
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const CollegeScreen()),
                                            );
                                          }),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                              // height: 60,
                              width: double.infinity,
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
                                        borderSide: BorderSide(
                                            color: ColourTheme.grey)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColourTheme.pink),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            //height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: !_isPasswordVisible,
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
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toggle the state of passwordVisible variable
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
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
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: TextButton(
                          //     onPressed: () {
                          //       //Forgot Password Connectivity with Supabase
                          //     },
                          //     child: GradientText(
                          //       "Forgot Password?",
                          //       style: TextStyle(
                          //         color: ColourTheme.secondary,
                          //         fontSize: 18,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50.0,
                            decoration: BoxDecoration(
                                gradient: ColourTheme.buttonGradient,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.5),
                                    blurRadius: 1.5,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () async {
                                    (isProcessing)
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : buttonPressed();
                                  },
                                  child: Center(
                                      child: (isProcessing)
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6),
                                              child: Text(
                                                "LOGIN",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ))),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const AboutUsScreen()),
                                  );
                                },
                                child: Text(
                                  'About Us',
                                  style: TextStyle(
                                      color: ColourTheme.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
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
      ]),
    );
  }

  Future buttonPressed() async {
    setState(() {
      isProcessing = true;
    });
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (_formKey.currentState!.validate()) {
      try {
        await supa.login(_email, _password);
      } on AuthException catch (error) {
        debugPrint(error.message.toString());
        debugPrint(error.statusCode.toString());

        if (error.message == "Invalid login credentials") {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBarLoginInvalidCredentials)
              .toString();
        }
        if (error.message == "Email not confirmed") {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBarLoginEmailNotConfirm)
              .toString();
        }
      }
      /* if () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarNoInternet)
                                      .toString();
                                } */
    }

    setState(() {
      isProcessing = false;
    });
  }
}
