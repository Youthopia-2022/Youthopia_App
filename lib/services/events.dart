import 'package:flutter/material.dart';

class Event {
  final String eventId;
  final String eventName;
  final String eventVenue;
  final TimeOfDay eventTime;
  final DateTime eventDate;
  final int eventFees;
  final String eventDescription;
  final bool isTeamEvent;
  final int eventMembers;
  final String eventPosterUrl;

  static List? techEvents;
  static List? culturalEvents;
  static List? informalEvents;
  static List? debateEvents;
  static List? artsEvents;

  Event(this.eventId,
      this.eventName,
      this.eventVenue,
      this.eventTime,
      this.eventDate,
      this.eventFees,
      this.eventDescription,
      this.isTeamEvent,
      this.eventMembers,
      this.eventPosterUrl,
      );
}