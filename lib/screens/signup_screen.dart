import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/widgets/snack_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.background,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1000,
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
                      "Welcome to Youthopia !",
                      style: TextStyle(
                          color: ColourTheme.white,
                          fontSize: 30,
                          fontFamily: 'IBM Plex'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                              color: ColourTheme.white,
                              fontSize: 18,
                              fontFamily: 'IBM Plex'),
                          text: "Already have an account "),
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
                                MaterialPageRoute(
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
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 8),
                      child: TextFormField(
                        validator: (String? value) {
                          String name = value!.trim();
                          return (name.isEmpty ||
                                  !RegExp(r'^[A-Za-z]+$').hasMatch(name))
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
                      style: TextStyle(fontSize: 20, color: ColourTheme.white),
                      decoration: InputDecoration(
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      onPressed: () async {
                        _formKey.currentState!.validate();
                        try {
                          final res = await Supabase.instance.client.auth
                              .signUp(email: _email,
                              password: _password,
                              data: {
                                'name': _name,
                                'phone': _phone,
                                'gender': _gender,
                                'college': _college,
                                'year': _year,
                              });
                          ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarSignupSuccess)
                                  .toString();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                                (Route<dynamic> route) => false,
                              );

                        } on AuthException catch(error) {
                          debugPrint(error.message.toString());
                        }
                        // debugPrint(_password);
                        // debugPrint(_email);
                        // if (_formKey.currentState!.validate()) {
                        //   final res = await supabaseHandler.createNewUser(
                        //       _email, _password);
                        //   debugPrint("Response code :$res");
                        //   if (res.error == null) {
                        //     debugPrint("Signup Successful");
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBarSignupSuccess)
                        //         .toString();
                        //     Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const Login()),
                        //       (Route<dynamic> route) => false,
                        //     );
                        //   } else {
                        //     debugPrint(res.error.toString());
                        //   }
                        //   return;
                        // } else {
                        //   debugPrint("Unsuccessful");
                        // }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColourTheme.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColourTheme.white)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              fontFamily: 'IBM Plex',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  // Container
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
