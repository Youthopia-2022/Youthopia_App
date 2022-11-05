import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/screens/category_screen.dart';
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
          title: Text(
            'Registered Events',
            style: TextStyle(
              color: ColourTheme.white,
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
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const CategoryScreen()));
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColourTheme.blue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ColourTheme.white)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              "Register Event",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        RegisteredEvent
                                            .registeredEvents[index].eventName,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ColourTheme.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Time: $eventTime',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColourTheme.lightGrey),
                                      ),
                                      Text(
                                        eventVenue,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColourTheme.lightGrey),
                                      )
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image(
                                    image: NetworkImage(
                                      RegisteredEvent
                                          .registeredEvents[index].eventPoster,
                                    ),
                                    width: 180,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    }));
  }
}
