import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/services/users.dart';

final supabase = Supabase.instance.client;

class Supa {
   late final userId;
   late final userData;

   UserProfile toUser(List<dynamic> result) {
     return UserProfile(
       result[0]['user_id'],
       result[0]['user_email'],
       result[0]['user_name'],
       result[0]['user_phone'],
       result[0]['user_gender'],
       result[0]['user_college'],
       result[0]['user_year'],
     );
   }

   Future<void> getCurrentProfile() async {
     try {
       final userId = supabase.auth.currentUser!.id;
       final userData = await supabase
           .from('profiles')
           .select()
           .eq('user_id', userId);
       UserProfile.currentUser = toUser(userData);
     } on PostgrestException catch (error) {
       debugPrint(error.toString());
     }

   }

  Future<List> getUserData() async {
    debugPrint("Getting user Data");
    userId = supabase.auth.currentUser!.id;
    userData = await supabase
        .from('profiles')
        .select()
        .eq('user_id', userId);
    debugPrint(userData.toString());
    return userData;
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
