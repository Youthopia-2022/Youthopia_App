import 'package:flutter/material.dart';

import '../constants/color_theme.dart';
import 'home_screen.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen(this.events, {super.key});

  final List events;

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
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
          itemCount: widget.events.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(height: 30,),
                Stack(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Image.network(
                                widget.events[index].eventPosterUrl,
                              height: 200,
                              width: 320,
                            )
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home(widget.events[index])));
                      },
                    ),
                    Positioned(
                      bottom: 00,
                      left: 0,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.events[index].eventName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
