import "package:flutter/material.dart";
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:youthopia_2022_app/services/supabase.dart';

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

  @override
  void dispose(){
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      "Youthopia 2022",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Create new account",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 10),
                        decoration: const BoxDecoration(color: Colors.black54),
                        child: TextFormField(
                          validator: (String? value){
                            return value==null ||  value.isEmpty ? "Name can't be empty" : null;
                          },
                          onSaved: (String? value){
                            _name = value!;
                          },
                          style: const TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
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
                        decoration: const BoxDecoration(color: Colors.black54),
                        child:  TextFormField(
                          validator: (String? value){
                            if(EmailValidator.validate(value!)) {
                              return null;
                            } else {
                              return 'Enter valid Email';
                            }
                          },
                          onSaved: (String? value){
                            _email = value!;
                          },
                          style: const TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
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
                      padding:
                          const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (String? value){
                          if(value!.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        onSaved: (String? value){
                          _password = value!;
                        },
                        style: const TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
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
                      padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        validator: (String? value){
                          if(_passwordController.text != _confirmPasswordController.text){
                            return 'Password does not match';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
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
                        if(_formKey.currentState!.validate())
                          {
                            final res = await supabaseHandler.createNewUser(
                                _email, _password);
                            debugPrint("Response code :$res");
                            if(res.error == null)
                              {
                                debugPrint("Signup Successful");
                              }
                            else
                              {
                                debugPrint(res.error.toString());
                              }
                            return;
                          }
                        else
                          {
                            debugPrint("Unsuccessful");
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
