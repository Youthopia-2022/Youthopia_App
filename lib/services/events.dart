import 'package:flutter/material.dart';

class Event {
  final String eventId;
  final String eventName;
  final String eventVenue;
  final TimeOfDay eventTime;
  final DateTime eventDate;
  final String eventFeesDIT;
  final String eventFeesOutsider;
  final String eventDescription;
  final bool isTeamEvent;
  final int eventMinMembers;
  final int eventMaxMembers;
  final String eventPosterUrl;

  static List? techEvents;
  static List? culturalEvents;
  static List? informalEvents;
  static List? debateEvents;
  static List? artsEvents;

  Event(
      this.eventId,
      this.eventName,
      this.eventVenue,
      this.eventTime,
      this.eventDate,
      this.eventFeesDIT,
      this.eventFeesOutsider,
      this.eventDescription,
      this.isTeamEvent,
      this.eventMinMembers,
      this.eventMaxMembers,
      this.eventPosterUrl);
}

class RegisteredEvent {
  final String eventId;
  final String eventName;
  final String eventVenue;
  final String eventTime;
  final String eventPoster;

  static List registeredEvents = [];

  RegisteredEvent(this.eventId, this.eventName, this.eventVenue, this.eventTime,
      this.eventPoster);
}

class MainEvents {
  final String eventId;
  final String eventName;
  final String eventTime;
  final String eventDate;
  final String eventPosterUrl;
  final String starName;

  static MainEvents? starNight;

  MainEvents(this.eventId, this.eventName, this.eventTime, this.eventDate,
      this.eventPosterUrl, this.starName);
}

class LiveEvents {
  final String eventId;
  final String eventName;
  final TimeOfDay eventTime;
  final DateTime eventDate;
  final String eventPosterUrl;
  Event event;

  static List? liveEvents;

  LiveEvents(this.eventId, this.eventName, this.eventTime, this.eventDate,
      this.eventPosterUrl, this.event);
}
