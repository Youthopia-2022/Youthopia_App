  import 'package:flutter/material.dart';
  import 'package:supabase_flutter/supabase_flutter.dart';
  import 'package:youthopia_2022_app/services/sponsors.dart';
  import 'package:youthopia_2022_app/services/team.dart';
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
      debugPrint(result['event_startTime']);
      debugPrint(result['event_date']);

    return Event(
        result['event_id'],
        result['event_name'],
        result['event_venue'],
        result['event_startTime'],
        result['event_date'],
        result['event_fees_dit'],
        result['event_fees_outsiders'],
        result['event_description'],
        result['event_isTeam'],
        result['event_min_members'],
        result['event_max_members'],
        '$eventPosterUrl.webp');
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
            .eq('event_category', 'Fine arts');
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
        result['event_venue'], result['event_startTime'], '$eventPosterUrl.webp');
  }

    Future<void> getRegisteredEvents() async {
      List regEvents = UserProfile.currentUser!.registeredEvents;
      String events = "";
      for (int i = 0; i < regEvents.length; i++) {
        final data = await supabase
            .from('events')
            .select(
              'event_id, event_name, event_venue, event_startTime',
            )
            .eq('event_id', regEvents[i]);
        if (!events.contains(data[0]['event_id'])) {
          RegisteredEvent.registeredEvents.add(registered(data[0]));
        }
        events = "${events + data[0]['event_id']}-";
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
      return Sponsors(result['sponsor_name'], result['sponsor_icon_url']);
    }

    Future<void> getSponsors() async {
      try {
        final data = await supabase.from('sponsors').select();
        Sponsors.sponsors = data.map((e) => toSponsor(e)).toList();
      } on PostgrestException catch (error) {
        debugPrint(error.toString());
      }
    }

    MainEvents toStarNight(List<dynamic> result) {
      return MainEvents(
          result[0]['event_id'],
          result[0]['event_name'],
          result[0]['event_time'],
          result[0]['event_date'],
          result[0]['event_poster_url'],
          result[0]['event_star_name']);
    }

    Future<void> getStarNight() async {
      try {
        final data = await supabase.from('daily-main-events').select();
        if (data.toString() != '[]') {
          MainEvents.starNight = toStarNight(data);
        }
      } on PostgrestException catch (error) {
        debugPrint(error.toString());
      }
    }

    LiveEvents toLive(Map<String, dynamic> result) {
      List? search;
      search = (result['event_id'].indexOf('tech') != -1)
          ? Event.techEvents
          : (result['event_id'].indexOf('cul') != -1)
              ? Event.culturalEvents
              : (result['event_id'].indexOf('inf') != -1)
                  ? Event.informalEvents
                  : (result['event_id'].indexOf('lit') != -1)
                      ? Event.debateEvents
                      : (result['event_id'].indexOf('fa') != -1)
                          ? Event.artsEvents
                          : null;
      Event? event;
      if (search != null) {
        for (int i = 0; i < search.length; i++) {
          if (search[i].eventId == result['event_id']) {
            event = search[i];
            break;
          }
        }
      }

      debugPrint(result['event_date'].toString());
      TimeOfDay time = TimeOfDay(
          hour: int.parse(result['event_time'].substring(0, 2)),
          minute: int.parse(result['event_time'].substring(3, 5)));
      DateTime date = DateTime.utc(
          int.parse(result['event_date'].substring(0, 4)),
          int.parse(result['event_date'].substring(5, 7)),
          int.parse(result['event_date'].substring(8, 10)));
      return LiveEvents(result['event_id'], result['event_name'], time, date,
          result['event_poster_url'], event!);
    }

    Future<void> getLiveEvents() async {
      try {
        final data = await supabase.from('live-events').select();
        debugPrint(data.toString());
        LiveEvents.liveEvents = data.map((e) => toLive(e)).toList();
      } on PostgrestException catch (error) {
        debugPrint(error.toString());
      }
    }

    Person toPerson(result) {
      return Person(
          result['name'], result['branch'], result['year'], result['url']);
    }

    Team toTeam(result) {
      List heads = result['team_head'].map((e) => toPerson(e)).toList();
      List members = result['team_members'].map((e) => toPerson(e)).toList();
      return Team(result['team_name'], heads, members);
    }

    Future<void> getAboutDetails() async {
      try {
        final data = await supabase.from('aboutus').select();
        Team.teams = data.map((e) => toTeam(e)).toList();
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
