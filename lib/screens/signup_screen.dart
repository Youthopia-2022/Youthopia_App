import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/widgets/snack_bar.dart';

import '../constants/gradient_color.dart';
import '../widgets/gradient_button.dart';

class SignUp extends StatefulWidget {
  const SignUp(
    this.collegeIsDIT, {
    super.key,
  });
  final bool collegeIsDIT;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // SupabaseHandler supabaseHandler = SupabaseHandler();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = "";
  String _email = "";
  String _password = "";
  String _phone = "";
  String _gender = "None";
  String _college = "";
  String _year = "None";
  late bool _isPasswordVisible;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _college = (widget.collegeIsDIT) ? "DIT University" : "";
    _isPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/bottomimg.png",
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            Form(
              key: _formKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.067,
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                              color: ColourTheme.white,
                              fontSize: 18,
                              fontFamily: 'IBM Plex'),
                          text: "Already have an account ? "),
                      TextSpan(
                          style: TextStyle(
                              color: ColourTheme.secondary,
                              fontSize: 18,
                              fontFamily: 'IBM Plex',
                              fontWeight: FontWeight.bold),
                          text: "Log in",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const Login()),
                                (Route<dynamic> route) => false,
                              );
                            }),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      //height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          String name = value!.trim();
                          return (name.isEmpty ||
                                  !RegExp(r'^[A-Za-z ]+$').hasMatch(name))
                              ? 'Enter valid Name'
                              : null;
                        },
                        onChanged: (String value) {
                          _name = value;
                        },
                        style: TextStyle(
                            fontSize: 20,
                            color: ColourTheme.white,
                            fontFamily: 'IBM Plex'),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.grey)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColourTheme.pink),
                            ),
                            hintText: "Name",
                            icon: Icon(
                              Icons.person,
                              color: ColourTheme.lightGrey,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'IBM Plex',
                              color: ColourTheme.lightGrey,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: TextFormField(
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
                            fontSize: 20,
                            color: ColourTheme.white,
                            fontFamily: 'IBM Plex'),
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
                              fontFamily: 'IBM Plex',
                              color: ColourTheme.lightGrey,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value!.length != 10 ||
                              !RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Enter valid Number';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          _phone = value;
                        },
                        style:
                            TextStyle(fontSize: 20, color: ColourTheme.white),
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
                              fontFamily: 'IBM Plex',
                              color: ColourTheme.lightGrey,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 72,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: DropdownButtonFormField(
                        value: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == "None") {
                            return 'Enter Gender';
                          }
                          return null;
                        },
                        items: [
                          DropdownMenuItem(
                              value: "None",
                              child: Text(
                                "Gender",
                                style: TextStyle(color: ColourTheme.lightGrey),
                              )),
                          const DropdownMenuItem(
                              value: "Male", child: Text("Male")),
                          const DropdownMenuItem(
                              value: "Female", child: Text("Female")),
                          const DropdownMenuItem(
                              value: "Others", child: Text("Others")),
                        ],
                        dropdownColor: ColourTheme.background,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: ColourTheme.lightGrey,
                        ),
                        style:
                            TextStyle(fontSize: 20, color: ColourTheme.white),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.pink)),
                            hintText: "Gender",
                            icon: Icon(
                              Icons.male,
                              color: ColourTheme.lightGrey,
                            ),
                            hintStyle: TextStyle(
                              color: ColourTheme.lightGrey,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        enabled: !widget.collegeIsDIT,
                        initialValue: _college,
                        validator: (String? value) {
                          return (value!.trim() == "")
                              ? 'College cannot be empty'
                              : null;
                        },
                        onChanged: (String value) {
                          _college = value;
                        },
                        style:
                            TextStyle(fontSize: 20, color: ColourTheme.white),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.pink)),
                            hintText: "College",
                            icon: Icon(
                              Icons.school,
                              color: ColourTheme.lightGrey,
                            ),
                            hintStyle: TextStyle(
                              color: ColourTheme.lightGrey,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 72,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: DropdownButtonFormField(
                        value: _year,
                        onChanged: (String? value) {
                          setState(() {
                            _year = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == "None") {
                            return 'Enter Current year';
                          }
                          return null;
                        },
                        items: [
                          DropdownMenuItem(
                              value: "None",
                              child: Text(
                                "Year",
                                style: TextStyle(color: ColourTheme.lightGrey),
                              )),
                          const DropdownMenuItem(
                              value: "one", child: Text("1st Year")),
                          const DropdownMenuItem(
                              value: "two", child: Text("2nd Year")),
                          const DropdownMenuItem(
                              value: "three", child: Text("3rd Year")),
                          const DropdownMenuItem(
                              value: "four", child: Text("4th Year")),
                        ],
                        dropdownColor: ColourTheme.background,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: ColourTheme.lightGrey,
                        ),
                        style:
                            TextStyle(fontSize: 20, color: ColourTheme.white),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColourTheme.pink)),
                            hintText: "Year",
                            icon: Icon(
                              Icons.ballot,
                              color: ColourTheme.lightGrey,
                            ),
                            hintStyle: TextStyle(
                              color: ColourTheme.lightGrey,
                            )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
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
                      style: TextStyle(fontSize: 20, color: ColourTheme.white),
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
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColourTheme.grey)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColourTheme.pink)),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  GradientButton(
                    onPressed: () async {
                      (isProcessing) ? null : buttonPressed();
                    },
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    text: "\t \t \t \tGet started",
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
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future buttonPressed() async {
    setState(() {
      isProcessing = true;
    });
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (_formKey.currentState!.validate()) {
      try {
        final dup = await supabase
            .from('profiles')
            .select('user_email')
            .eq('user_email', _email);

        if (dup.toString() == '[]') {
          final res = await Supabase.instance.client.auth
              .signUp(email: _email, password: _password, data: {
            'name': _name,
            'phone': _phone,
            'gender': _gender,
            'college': _college,
            'year': _year,
          });
          debugPrint(res.toString());

          ScaffoldMessenger.of(context)
              .showSnackBar(snackBarSignupSuccess)
              .toString();

          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const Login()),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBarEmailExists)
              .toString();
        }
      } on AuthException catch (error) {
        debugPrint(error.toString());
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(snackBarNoInternet)
        //     .toString();
      }
    }

    setState(() {
      isProcessing = false;
    });
  }
}
