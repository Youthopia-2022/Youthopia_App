import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        backgroundColor: const Color(0xFF0F0F0F),
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
              childAspectRatio: 0.45,
              children: List.generate(totalItems, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Home(widget.events[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF101010),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  widget.events[index].eventPosterUrl),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, left: 8, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.events[index].eventName,
                                  style: TextStyle(
                                      color: ColourTheme.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
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
                              widget.events[index].eventTime,
                              style: TextStyle(
                                  color: ColourTheme.white, fontSize: 15),
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
                              size: 20,
                              color: ColourTheme.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.events[index].eventDate,
                              style: TextStyle(
                                  color: ColourTheme.white, fontSize: 15),
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
                              size: 20,
                              color: ColourTheme.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                widget.events[index].eventVenue,
                                overflow: TextOverflow.ellipsis,  //fixes #119
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
