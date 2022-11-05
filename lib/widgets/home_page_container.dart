import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/services/events.dart';

class HomePageContainer extends StatefulWidget {
  const HomePageContainer({
    super.key,
  });

  @override
  State<HomePageContainer> createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: <Widget>[
            Image.network(
              MainEvents.starNight!.eventPosterUrl,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            Positioned(
              bottom: 10,
              left: 8,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MainEvents.starNight!.eventName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'By ${MainEvents.starNight!.starName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 10,
              left: 8,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(
                                    Icons.schedule,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                  text: '  ${MainEvents.starNight!.eventTime}')
                            ],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  )),
            ),
            Positioned(
              bottom: 10,
              right: 8,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                  text: '  ${MainEvents.starNight!.eventDate}')
                            ],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
