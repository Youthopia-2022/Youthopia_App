import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/services/sponsors.dart';
import 'package:youthopia_2022_app/services/users.dart';
import 'package:youthopia_2022_app/services/events.dart';

final supabase = Supabase.instance.client;

class Supa {
  UserProfile toUser(List<dynamic> result) {
    return UserProfile(
        result[0]['user_id'],
        result[0]['user_email'],
        result[0]['user_name'],
        result[0]['user_phone'],
        result[0]['user_gender'],
        result[0]['user_college'],
        result[0]['user_year'],
        result[0]['events_registered']);
  }

  Future<void> getCurrentProfile() async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final userData =
          await supabase.from('profiles').select().eq('user_id', userId);
      UserProfile.currentUser = toUser(userData);
    } on PostgrestException catch (error) {
      debugPrint(error.toString());
    }
  }

  Event toEvent(Map<String, dynamic> result) {
    final String eventPosterUrl = Supabase.instance.client.storage
        .from('event-posters')
        .getPublicUrl(result['event_id']);

    int hr = int.parse(result['event_startTime'].substring(0, 2));
    int min = int.parse(result['event_startTime'].substring(3, 5));
    return Event(
        result['event_id'],
        result['event_name'],
        result['event_venue'],
        TimeOfDay(hour: hr, minute: min),
        DateTime.parse(result['event_date']),
        result['event_fees'],
        result['event_description'],
        result['event_isTeam'],
        result['event_members'],
        '$eventPosterUrl.png');
  }

  Future<void> getEventData() async {
    try {
      final technical = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Technical');
      Event.techEvents = technical.map((e) => toEvent(e)).toList();
      final cultural = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Cultural');
      Event.culturalEvents = cultural.map((e) => toEvent(e)).toList();

      final informal = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Informal');
      Event.informalEvents = informal.map((e) => toEvent(e)).toList();

      final debate = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Literary');
      Event.debateEvents = debate.map((e) => toEvent(e)).toList();

      final arts = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Fine Arts');
      Event.artsEvents = arts.map((e) => toEvent(e)).toList();
    } on PostgrestException catch (error) {
      debugPrint(error.toString());
    }
  }

  RegisteredEvent registered(result) {
    final String eventPosterUrl = Supabase.instance.client.storage
        .from('event-posters')
        .getPublicUrl(result['event_id']);
    return RegisteredEvent(result['event_id'], result['event_name'],
        result['event_venue'], result['event_time'], '$eventPosterUrl.png');
  }

  Future<void> getRegisteredEvents() async {
    List regEvents = UserProfile.currentUser!.registeredEvents;
    debugPrint(UserProfile.currentUser!.registeredEvents.toString());
    int eventCount = 0;
    String events = "";
    for (int i = 0; i < regEvents.length; i++) {
      bool flag = false;
      final data = await supabase
          .from('events')
          .select(
            'event_id, event_name, event_venue, event_time',
          )
          .eq('event_id', regEvents[i]);
      if(events.indexOf(data[0]['event_id']) == -1) {
        RegisteredEvent.registeredEvents.add(registered(data[0]));
      }
      events = "${events + data[0]['event_id']}-" ;
      // if (i == 0) {
      //   RegisteredEvent.registeredEvents.add(registered(data[0]));
      // } else {
      //   for (int j = 0; j < RegisteredEvent.registeredEvents.length; j++) {
      //     if (data[0]['event_id'] ==
      //         RegisteredEvent.registeredEvents[j].eventId) {
      //       flag = true;
      //       break;
      //     }
      //   }
      //   if (!flag) {
      //     RegisteredEvent.registeredEvents.add(registered(data[0]));
      //   }
      // }

    }
  }

  Sponsors toSponsor(Map<String, dynamic> result) {
    return Sponsors(
        result['sponsor_name'],
        result['sponsor_icon_url']);
  }

  Future<void> getSponsors() async {
    try {
      final data = await supabase
          .from('sponsors')
          .select();
      Sponsors.sponsors = data.map((e) => toSponsor(e)).toList();
    } on PostgrestException catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> signOut() {
    return supabase.auth.signOut();
  }

  Future<AuthResponse> login(email, password) {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }
}
