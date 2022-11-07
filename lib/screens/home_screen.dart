import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:youthopia_2022_app/screens/team_reg_form_screen.dart';
import 'package:youthopia_2022_app/services/events.dart';
import 'package:intl/intl.dart';
import 'package:youthopia_2022_app/services/users.dart';
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
  bool isDIT =
      (UserProfile.currentUser!.userCollege == 'DIT University') ? true : false;

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
                  widget.event.eventTime,
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
                  widget.event.eventDate,
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
                Flexible(
                  child: Text(
                    widget.event.eventVenue,
                    style: TextStyle(color: ColourTheme.white, fontSize: 20),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.currency_rupee,
                  color: ColourTheme.white,
                  size: 25,
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Text(
                    (isDIT)
                        ? widget.event.eventFeesDIT
                        : widget.event.eventFeesOutsider,
                    style: TextStyle(color: ColourTheme.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            (widget.event.isTeamEvent)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Minimum members: ${widget.event.eventMinMembers}',
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Maximum members: ${widget.event.eventMaxMembers}',
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 20),
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 0,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                  gradient: ColourTheme.buttonGradient,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 1.5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
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
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "Register for this Event",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ))),
              ),
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
