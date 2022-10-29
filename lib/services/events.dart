import 'package:flutter/material.dart';

class Event {
  final String eventId;
  final String clubId;
  final String eventName;
  final String eventVenue;
  final TimeOfDay eventTime;
  final DateTime eventDate;
  final int eventfees;
  final String eventDescription;

  final String eventPosterUrl;

  Event(this.eventId,
      this.clubId,
      this.eventName,
      this.eventVenue,
      this.eventTime,
      this.eventDate,
      this.eventfees,
      this.eventDescription,
      this.eventPosterUrl);
}