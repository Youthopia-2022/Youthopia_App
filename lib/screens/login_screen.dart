import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/loading_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';

import '../constants/gradient_color.dart';
import '../widgets/gradient_button.dart';
import '../widgets/snack_bar.dart';
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
  late final StreamSubscription<AuthState> _authStateSubscription;
  late bool _isPasswordVisible;
  Supa supa = Supa();
  bool isProcessing = false;

  @override
  void initState() {
    _authStateSubscription =
        supabase.auth.onAuthStateChange.listen((data) async {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const LoadingScreen()),
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
            alignment: Alignment.bottomLeft,
          ),
        ),
        Form(
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
                          GradientButton(
                            onPressed: () async {
                              (isProcessing)
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : buttonPressed();
                            },
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            text: "\t \t \t \t \t\tLogin",
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
