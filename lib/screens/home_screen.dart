import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:youthopia_2022_app/screens/team_reg_form_screen.dart';
import 'package:youthopia_2022_app/services/events.dart';
import 'package:intl/intl.dart';
import '../constants/color_theme.dart';
import '../widgets/gradient_button.dart';
import 'individual_reg_form_screen.dart';

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
      backgroundColor: const Color(0xFF0F0F0F),
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
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Image(
                    image: NetworkImage(widget.event.eventPosterUrl),
                    width: double.maxFinite,
                    fit: BoxFit.cover),
                Positioned(
                  top: 00,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: const SizedBox(
                        width: 60,
                        child: Image(
                          image: AssetImage('assets/DITU_Highres_WHITE.png'),
                        )),
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
                  color: ColourTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
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
                  color: ColourTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.event.eventDescription,
              style: TextStyle(color: ColourTheme.white, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            GradientButton(
              onPressed: () {
                (!widget.event.isTeamEvent)
                    ? Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                DITIndividualRegFormScreen(widget.event)))
                    : Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                DITTeamRegFormScreen(widget.event)));
              },
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              text: "Register For this Event",
              titleStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: "IBM Plex Sans",
                  color: Colors.white),
              textColor: Colors.black87,
              //icon: (FontAwesomeIcons.arrowRight),
              //iconColor: const Color.fromARGB(255, 255, 255, 255),
              gradientColor1: const Color(0xFFF7797D),
              gradientColor2: const Color(0xFFC471ED),
              gradientColor3: const Color(0xFF12C2E9),
              hoverElv: 20,
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
