import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/color_theme.dart';
import 'home_screen.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen(this.events, {super.key});

  final List events;

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
    totalItems = widget.events.length;
  }

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
          'All Events',
          style: TextStyle(
            color: ColourTheme.white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return GridView.count(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              children: List.generate(totalItems, (index) {
                return
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF101010),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  Home(widget.events[index])));
                    },
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              widget.events[index].eventPosterUrl),
                        ),
                        Text(
                          widget.events[index].eventName,
                          style: TextStyle(
                              color: ColourTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 20,
                              color: ColourTheme.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.events[index].eventTime
                                  .toString()
                                  .substring(10, 15),
                              style: TextStyle(
                                  color: ColourTheme.white, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.event_available_outlined,
                              size: 20,
                              color: ColourTheme.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(widget.events[index].eventDate)
                                  .toString(),
                              style: TextStyle(
                                  color: ColourTheme.white, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: ColourTheme.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                widget.events[index].eventVenue,
                                style: TextStyle(
                                    color: ColourTheme.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}
