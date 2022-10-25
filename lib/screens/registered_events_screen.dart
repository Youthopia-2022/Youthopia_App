import 'package:flutter/material.dart';

import '../constants/color_theme.dart';

class RegisteredEvents extends StatefulWidget {
  const RegisteredEvents({Key? key}) : super(key: key);

  @override
  State<RegisteredEvents> createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
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
        backgroundColor: ColourTheme.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the Event',
                      style: TextStyle(fontSize: 16, color: ColourTheme.white),
                    ),
                    Text(
                      'Time: 10:00 AM',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    ),
                    Text(
                      'Venue: Hall',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    )
                  ],
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image(
                    image: AssetImage(
                      'assets/sample 1.jpg',
                    ),
                    width: 180,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the Event',
                      style: TextStyle(fontSize: 16, color: ColourTheme.white),
                    ),
                    Text(
                      'Time: 10:00 AM',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    ),
                    Text(
                      'Venue: Hall',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    )
                  ],
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image(
                    image: AssetImage(
                      'assets/sample 2.jpg',
                    ),
                    width: 180,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the Event',
                      style: TextStyle(fontSize: 16, color: ColourTheme.white),
                    ),
                    Text(
                      'Time: 10:00 AM',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    ),
                    Text(
                      'Venue: Hall',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    )
                  ],
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image(
                    image: AssetImage(
                      'assets/sample 3.jpg',
                    ),
                    width: 180,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the Event',
                      style: TextStyle(fontSize: 16, color: ColourTheme.white),
                    ),
                    Text(
                      'Time: 10:00 AM',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    ),
                    Text(
                      'Venue: Hall',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    )
                  ],
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image(
                    image: AssetImage(
                      'assets/sample 4.jpg',
                    ),
                    width: 180,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of the Event',
                      style: TextStyle(fontSize: 16, color: ColourTheme.white),
                    ),
                    Text(
                      'Time: 10:00 AM',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    ),
                    Text(
                      'Venue: Hall',
                      style: TextStyle(fontSize: 12, color: ColourTheme.lightGrey),
                    )
                  ],
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image(
                    image: AssetImage(
                      'assets/sample 5.jpg',
                    ),
                    width: 180,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
