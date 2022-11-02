import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';
import 'package:youthopia_2022_app/screens/registered_events_screen.dart';
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
  String _genderImage = 'assets/profile_male.jpg';

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
        _genderImage = (_gender == "Female")
            ? 'assets/profile_female.jpg'
            : 'assets/profile_male.jpg';
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
              child: SizedBox(
                height: 600,
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
                        style:
                            TextStyle(fontSize: 22, color: ColourTheme.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        _email!,
                        style: TextStyle(
                            fontSize: 18, color: ColourTheme.lightGrey),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'MOBILE NUMBER',
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        _phone!,
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'YEAR',
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
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
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'COLLEGE',
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        (_college == null) ? "None" : _college!,
                        style:
                            TextStyle(fontSize: 18, color: ColourTheme.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: TextButton.icon(
                            onPressed: () async {
                              try {
                                await supa.signOut();
                              } on AuthException catch (error) {
                                debugPrint(error.toString());
                              }

                              if (mounted) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                  (Route<dynamic> route) => false,
                                );
                              }
                            },
                            icon: Icon(
                              Icons.logout,
                              color: ColourTheme.white,
                            ),
                            label: Text(
                              'Log out',
                              style: TextStyle(color: ColourTheme.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
