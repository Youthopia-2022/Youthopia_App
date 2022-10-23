import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';

import '../constants/color_theme.dart';
import '../services/supabase.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/profile_img.jpg'))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Vijayant Singh',
              style: TextStyle(fontSize: 22, color: ColourTheme.white),
            ),
          ),
          Center(
            child: Text(
              'vijayant.singh003@gmail.com',
              style: TextStyle(fontSize: 18, color: ColourTheme.lightGrey),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'MOBILE NUMBER',
              style: TextStyle(fontSize: 22, color: ColourTheme.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '7318470477',
              style: TextStyle(fontSize: 18, color: ColourTheme.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'YEAR',
              style: TextStyle(fontSize: 22, color: ColourTheme.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '2nd Year',
              style: TextStyle(fontSize: 18, color: ColourTheme.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'College',
              style: TextStyle(fontSize: 22, color: ColourTheme.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'DIT University',
              style: TextStyle(fontSize: 18, color: ColourTheme.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColourTheme.blue),
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColourTheme.black)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text("Registered Events"),
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              try{
                await supabase.auth.signOut();
              } on AuthException catch (error) {
                debugPrint(error.toString());
              }

              if(mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Login()),
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
            style: TextStyle(
              color: ColourTheme.white
            ),
          ),
          )
        ],
      ),
    );
  }
}
