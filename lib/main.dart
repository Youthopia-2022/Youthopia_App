import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/screens/login_screen.dart';
import 'package:supabase/supabase.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = 'https://bwqibqbxbirzbyjqovco.supabase.co';
  const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ3cWlicWJ4YmlyemJ5anFvdmNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjU2NDMxNTcsImV4cCI6MTk4MTIxOTE1N30.7TLUvzsw1-YI-G02oDJbsHHH7U5d1RS25-b-mLiXL6M';

  final client = SupabaseClient(supabaseUrl, supabaseKey);


  runApp(

      //! Uncomment to enable Device Preview
/*     DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ), */

      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
