import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youthopia_2022_app/screens/loading_screen.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_KEY']!);


  runApp(
      //! Uncomment to enable Device Preview
/*       DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(), // Wrap your app
  )); */

   const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'IBM Plex'
          ),
          debugShowCheckedModeBanner: false,
          home: const LoadingScreen(),
        );
      },
    );
  }
}
