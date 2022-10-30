import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';

import '../services/supabase.dart';
import 'login_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _redirectCalled = false;
  Supa supa = Supa();

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async{
    await Future.delayed(Duration.zero);
    if(_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabase.auth.currentSession;
    if(session != null){
     await supa.getCurrentProfile();
     await supa.getEventData();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const NavBarScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.background,
      body: const Center(child: CircularProgressIndicator())
    );
  }
}

