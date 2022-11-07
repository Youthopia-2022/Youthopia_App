import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youthopia_2022_app/constants/gradient_color.dart';
import 'package:youthopia_2022_app/screens/nav_bar_screen.dart';
import 'package:youthopia_2022_app/services/supabase.dart';
import 'package:youthopia_2022_app/services/users.dart';

import '../constants/color_theme.dart';
import '../services/events.dart';

class RegisteredEvents extends StatefulWidget {
  const RegisteredEvents({Key? key}) : super(key: key);

  @override
  State<RegisteredEvents> createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
  bool _isLoaded = false;
  bool eventsRegistered = true;
  Supa supa = Supa();
  @override
  void initState() {
    super.initState();
    if (UserProfile.currentUser!.registeredEvents.toString() == '[]') {
      setState(() {
        eventsRegistered = false;
        return;
      });
    }
    eventsData();
  }

  Future<void> eventsData() async {
    RegisteredEvent.registeredEvents = [];
    await supa.getRegisteredEvents();
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.black,
      appBar: AppBar(
        title: const GradientText(
          'Registered Events',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans',
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
      ),
      body: (!eventsRegistered)
          ? SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 50.0, top: 20),
                        child: Image(
                          image: AssetImage('assets/r2.png'),
                        ),
                      ),
                    ],
                  ),
                  const SingleChildScrollView(
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/r1.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  const Center(
                    child: Text(
                      'Oh! you’re not registered \n \t \t \t \t \t for any events.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 50.0,
                      decoration: BoxDecoration(
                          gradient: ColourTheme.buttonGradient,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(0.0, 1.5),
                              blurRadius: 1.5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50)),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const NavBarScreen(false)));
                            },
                            child: const Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                "Register Event",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ))),
                      )),
                ],
              ),
            )
          : (!_isLoaded)
              ? Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Image(
                      image: AssetImage('assets/loading.gif'),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: RegisteredEvent.registeredEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    String eventTime =
                        RegisteredEvent.registeredEvents[index].eventTime;
                    String eventVenue =
                        RegisteredEvent.registeredEvents[index].eventVenue;
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          color: const Color(0xFF1B1B1B),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                            MediaQuery.of(context).size.width * 0.4,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      RegisteredEvent
                                          .registeredEvents[index].eventName,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: ColourTheme.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 13.0, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(FontAwesomeIcons.clock,
                                              size: 15,
                                              color: Color(0xFF666666)),
                                          Text(
                                            '   ${eventTime}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: ColourTheme.lightGrey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      eventVenue,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: ColourTheme.lightGrey),
                                    )
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: Image(
                                  image: NetworkImage(
                                    RegisteredEvent
                                        .registeredEvents[index].eventPoster,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                  MediaQuery.of(context).size.width * 0.5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
