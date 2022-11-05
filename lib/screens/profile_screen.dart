import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';
import 'package:youthopia_2022_app/services/users.dart';
import '../constants/color_theme.dart';
import '../services/supabase.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _name;
  String? _email;
  String? _phone;
  String? _year;
  String? _college;
  String? _gender;
  String _genderImage = 'assets/male.png';

  Supa supa = Supa();

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  Future<void> _getProfile() async {
    setState(() {
      _name = UserProfile.currentUser!.userName;
      _email = UserProfile.currentUser!.userEmail;
      _phone = UserProfile.currentUser!.userPhone;
      _year = UserProfile.currentUser!.userYear;
      _college = UserProfile.currentUser!.userCollege;
      _gender = UserProfile.currentUser!.userGender;
      _genderImage =
          (_gender == "Female") ? 'assets/female.png' : 'assets/male.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: ColourTheme.black,
        title: Text(
          'Settings',
          style: TextStyle(
            color: ColourTheme.white,
          ),
        ),
      ),
      body: (_name == null)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(_genderImage))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      _name!,
                      style: TextStyle(fontSize: 22, color: ColourTheme.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      _email!,
                      style:
                          TextStyle(fontSize: 18, color: ColourTheme.lightGrey),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'MOBILE NUMBER',
                      style: TextStyle(fontSize: 18, color: Color(0xFF93959E)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        _phone!,
                        style:
                            TextStyle(fontSize: 24, color: ColourTheme.white),
                      ),
                    ),
                  ),
                  Divider(
                    color: const Color(0xFF101010),
                    thickness: 4.0,
                    indent: MediaQuery.of(context).size.width * 0.04,
                    endIndent: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: const Text(
                      'YEAR',
                      style: TextStyle(fontSize: 18, color: Color(0xFF93959E)),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 10.0, top: 5),
                    child: Text(
                      (_year == "one")
                          ? "1st Year"
                          : (_year == "two")
                              ? "2nd Year"
                              : (_year == "three")
                                  ? "3rd Year"
                                  : (_year == "four")
                                      ? "4th Year"
                                      : "None",
                      style: TextStyle(fontSize: 24, color: ColourTheme.white),
                    ),
                  ),
                  Divider(
                    color: const Color(0xFF101010),
                    thickness: 4.0,
                    indent: MediaQuery.of(context).size.width * 0.04,
                    endIndent: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                    ),
                    child: const Text(
                      'COLLEGE',
                      style: TextStyle(fontSize: 18, color: Color(0xFF93959E)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10.0,
                      top: 5,
                    ),
                    child: Text(
                      (_college == null) ? "None" : _college!,
                      style: TextStyle(fontSize: 24, color: ColourTheme.white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextButton(
                        onPressed: () async {
                          try {
                            await supa.signOut();
                          } on AuthException catch (error) {
                            debugPrint(error.toString());
                          }

                          if (mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const Login()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF191919),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColourTheme.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              const Icon(
                                  FontAwesomeIcons.arrowRightFromBracket),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              const Text(
                                "Log Out",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
