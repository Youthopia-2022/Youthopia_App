import "package:flutter/material.dart";
import 'package:youthopia_2022_app/services/events.dart';
import 'package:intl/intl.dart';
import '../constants/color_theme.dart';
import '../constants/gradient_color.dart';
import 'individual_reg_form_screen.dart';
import 'team_reg_form_screen.dart';

class Home extends StatefulWidget {
  const Home(this.event, {super.key});

  final Event event;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.black,
      appBar: AppBar(
        backgroundColor: ColourTheme.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.event.eventName,
          style: TextStyle(
            color: ColourTheme.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Image(
                    image: NetworkImage(
                  widget.event.eventPosterUrl
                    ),
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 00,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: SizedBox(
                      width: 60,
                      child: Image(
                        image: AssetImage(
                          'assets/DITU_Highres_WHITE.png'
                        ),
                      )
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Event info',
              style: TextStyle(
                  color: ColourTheme.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 25,
                  color: ColourTheme.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  widget.event.eventTime.toString().substring(10, 15),
                  style: TextStyle(color: ColourTheme.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.event_available_outlined,
                  size: 25,
                  color: ColourTheme.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  DateFormat('dd-MM-yyyy')
                      .format(widget.event.eventDate)
                      .toString(),
                  style: TextStyle(color: ColourTheme.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 25,
                  color: ColourTheme.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  widget.event.eventVenue,
                  style: TextStyle(color: ColourTheme.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.payments_outlined,
                  color: ColourTheme.white,
                  size: 25,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  '₹ ${widget.event.eventFees}',
                  style: TextStyle(color: ColourTheme.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Description',
              style: TextStyle(
                  color: ColourTheme.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.event.eventDescription,
              style: TextStyle(
                  color: ColourTheme.white, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                (!widget.event.isTeamEvent)
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DITIndividualRegFormScreen(widget.event)))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DITTeamRegFormScreen(widget.event)));
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Register for this event',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
