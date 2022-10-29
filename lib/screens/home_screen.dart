import "package:flutter/material.dart";
import 'package:youthopia_2022_app/services/events.dart';
import 'package:intl/intl.dart';
import '../constants/color_theme.dart';
import '../constants/gradient_color.dart';
import 'dit_registration_form_screen.dart';

class Home extends StatefulWidget {
  const Home(
      this.event,
      {super.key});

  final Event event;


  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getEventData();
  }

  Future<void> _getEventData() async {

    debugPrint(widget.event.eventId);
    debugPrint(widget.event.clubId);
    debugPrint(widget.event.eventName);
    debugPrint(widget.event.eventVenue);
    debugPrint(widget.event.eventTime.toString());
    debugPrint(widget.event.eventDate.toString());
    debugPrint(widget.event.eventfees.toString());
    debugPrint(widget.event.eventDescription);


    setState(() {
      _isLoaded = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    return (!_isLoaded) ? const Center(child: CircularProgressIndicator()) :
    Scaffold(
      backgroundColor: const Color(0xFF161515),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.1, 0.6, 0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFD9D9D9),
                    Color(0xFF323232),
                    Color.fromARGB(255, 22, 21, 21),
                  ],
                ),
              ),
              //color: const Color.fromARGB(255, 43, 40, 40),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 20, 19, 19),
                          ),
                          iconSize: 30,
                        ),
                        const Image(
                          image: AssetImage('assets/DITU_Highres_WHITE.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 420,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientText(
                          widget.event.eventName,
                          style: const TextStyle(fontSize: 38),
                        ),
                        const Image(
                          image: AssetImage(
                            'assets/CodeGenX-logo-W 1.png',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Venue",
                              style: TextStyle(
                                color: ColourTheme.blue,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              widget.event.eventVenue,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 225, 235, 238),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                  color: ColourTheme.blue,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                  DateFormat('dd-MM-yyyy').format(widget.event.eventDate).toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Time",
                                style: TextStyle(
                                  color: ColourTheme.blue,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.event.eventTime.toString().substring(10,15),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: ColourTheme.blue,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.event.eventfees.toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   //mainAxisAlignment: MainAxisAlignment.start,
                          //   children: const [
                          //     Text(
                          //       "GPF",
                          //       style: TextStyle(
                          //         color: Color(0xFF1BBEE9),
                          //         fontSize: 18,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.event.eventDescription,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const DITRegistrationForm()));
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 24.0,
                        ),
                        label: const Text(
                          'Register Now',
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ))) // <-- Text
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
