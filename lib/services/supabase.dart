import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class Supa {
   late final userId;
   late final userData;

  Future<void> getUserData() async {
    debugPrint("Getting user Data");
    userId = supabase.auth.currentUser!.id;
    userData = await supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .single() as Map;
    debugPrint(userData.toString());
  }

  Future<void> signOut() {
    return supabase.auth.signOut();
}

  Future<AuthResponse> login(email, password) {
    return supabase.auth
        .signInWithPassword(
      email: email,
      password: password);
  }



}
