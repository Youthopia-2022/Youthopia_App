import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';
import 'package:youthopia_2022_app/screens/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import '../widgets/alert_dialog.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SupabaseHandler supabaseHandler = SupabaseHandler();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _phone = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.background,
      resizeToAvoidBottomInset: false,
      body: Form(
          key: _formKey,
          child: Stack(
            children: [
              // Positioned.fill(
              //   child: Image.asset(
              //     "assets/bg.jpg",
              //     fit: BoxFit.cover,
              //     color: Colors.black38,
              //     colorBlendMode: BlendMode.darken,
              //   ),
              // ),
              // Positioned(
              //   top: 60,
              //   left: 15,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.arrow_back_ios_new,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      ShaderMask(
                        shaderCallback: (Rect rect) {
                          return ColourTheme.primaryGradient.createShader(rect);
                        },
                        child: Text(
                          "Welcome back to \nYouthopia !",
                          style: TextStyle(
                            color: ColourTheme.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 8),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value!.length != 10) {
                                return 'Enter valid Number';
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              _phone = value;
                            },
                            style: TextStyle(
                                fontSize: 20, color: ColourTheme.lightGrey),
                            decoration: InputDecoration(

                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColourTheme.grey)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColourTheme.pink)),
                                hintText: "Phone number",
                                icon: Icon(
                                  Icons.phone,
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
                          style:
                          TextStyle(fontSize: 20, color: ColourTheme.lightGrey),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: ColourTheme.pink,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final res = await supabaseHandler.signInExistingUser(
                                  _phone, _password);
                              debugPrint("Response code :$res");
                              if (res.error == null) {
                                debugPrint("Sign in Successful");
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertUI('Invalid Credentials');
                                    });
                                debugPrint(res.error.toString());

                                return;
                              }
                            }
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const NavBarScreen()),
                            //   (Route<dynamic> route) => false,
                            // );
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)
                                  )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(ColourTheme.blue),
                              foregroundColor: MaterialStateProperty.all<Color>(ColourTheme.black)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text("LOGIN"),
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
                                    color: ColourTheme.lightGrey, fontSize: 18),
                                text: "Don't have an account yet "),
                            TextSpan(
                                style: TextStyle(
                                    color: ColourTheme.pink, fontSize: 18),
                                text: "Sign in",
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
                      // Container
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
