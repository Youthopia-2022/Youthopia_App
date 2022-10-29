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
  final String eventPosterUrl;

  Event(this.eventId,
      this.eventName,
      this.eventVenue,
      this.eventTime,
      this.eventDate,
      this.eventFees,
      this.eventDescription,
      this.isTeamEvent,
      this.eventPosterUrl );
}