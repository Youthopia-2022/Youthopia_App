import 'package:supabase/supabase.dart';

class SupabaseHandler{

  static String supabaseUrl = 'https://bwqibqbxbirzbyjqovco.supabase.co';
  static String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ3cWlicWJ4YmlyemJ5anFvdmNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjU2NDMxNTcsImV4cCI6MTk4MTIxOTE1N30.7TLUvzsw1-YI-G02oDJbsHHH7U5d1RS25-b-mLiXL6M';

  final client = SupabaseClient(supabaseUrl, supabaseKey);

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