import 'package:supabase/supabase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseHandler{

  static String? supabaseUrl = dotenv.env['SUPABASE_URL'];
  static String? supabaseKey = dotenv.env['SUPABASE_KEY'];

  final client = SupabaseClient(supabaseUrl!, supabaseKey!);

  Future<GotrueSessionResponse> createNewUser(
      String email, String password) async  {
    final res = await client.auth.signUp(email, password);

    return res;
  }

  Future<GotrueSessionResponse> signInExistingUser(
      String email, String password) async {
    final res = await client.auth.signIn(
      email: email,
      password: password,
    );

    return res;
  }
}