import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabase.auth.currentSession;
    if (session != null) {
      supa.getStarNight();
      supa.getSponsors();
      supa.getCurrentProfile();
      await supa.getEventData();
      debugPrint("getting");
      await supa.getLiveEvents();
      debugPrint("completed");

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const NavBarScreen(true)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.black,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Image(
            image: AssetImage('assets/loading.gif'),
          ),
        ),
      ),
    );
  }
}
