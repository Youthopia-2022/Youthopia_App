import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
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
  SupabaseHandler supabaseHandler = SupabaseHandler();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = "";
  String _email = "";
  String _password = "";
  String _phone = "";

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
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
                      child: const Text(
                        "Welcome to Youthopia !",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            text: "Already have an account "),
                        TextSpan(
                            style: TextStyle(
                                color: ColourTheme.pink, fontSize: 18),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 8),
                        child: TextFormField(
                          validator: (String? value) {
                            String name = value!.trim();
                            return name.isEmpty
                                ? ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar)
                                    .toString()
                                : null;
                          },
                          onChanged: (String value) {
                            _name = value;
                          },
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF666666))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "Name",
                              icon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 10),
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
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF666666))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "Email",
                              icon: Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 10),
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
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: const InputDecoration(
                              /* enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF666666)
                                  )),*/

                              /* focusedBorder: BoxDecoration(
                                border: Border(
                                    {BorderSide bottom = BorderSide(
            
                                    )}),
                              ),*/
                              hintText: "Phone number",
                              icon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
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
                            const TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF666666))),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Password",
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      child: TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        validator: (String? value) {
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF666666))),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Confirm Password",
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        debugPrint(_password);
                        debugPrint(_email);
                        if (_formKey.currentState!.validate()) {
                          final res = await supabaseHandler.createNewUser(
                              _email, _password);
                          debugPrint("Response code :$res");
                          if (res.error == null) {
                            debugPrint("Signup Successful");
                          } else {
                            debugPrint(res.error.toString());
                          }
                          return;
                        } else {
                          debugPrint("Unsuccessful");
                          //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const NavBarScreen()),
                        //   (Route<dynamic> route) => false,
                        // );
                      },
                      minWidth: double.maxFinite,
                      color: Colors.red[700],
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text("Create Account"),
                      ),
                    )
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
