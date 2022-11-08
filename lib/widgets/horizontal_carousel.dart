import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/color_theme.dart';
import '../screens/home_screen.dart';

class Carousel extends StatefulWidget {
  const Carousel(this.list,
      {super.key,
      required this.auto,
      required this.enlarge,
      required this.loop,
      required this.height});
  final List list;
  final bool auto;
  final bool enlarge;
  final bool loop;
  final double height;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          enableInfiniteScroll: widget.loop,
          initialPage: 0,
          autoPlay: widget.auto,
          height: widget.height,
          enlargeCenterPage: widget.enlarge,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: widget.list
          .map((item) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => Home(item.event)));
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item.eventPosterUrl,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.height,
                        ),
                        Positioned(
                          bottom: 00,
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
                                                Icons.event_available_outlined,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              alignment:
                                                  PlaceholderAlignment.middle),
                                          TextSpan(
                                            text:
                                                '   ${DateFormat('dd-MM-yyyy').format(item.eventDate).toString()}',
                                          )
                                        ],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Text(
                                    item.eventName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Positioned(
                          top: 00,
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
                                              alignment:
                                                  PlaceholderAlignment.middle),
                                          TextSpan(
                                            text:
                                                '  ${item.eventTime}',
                                          )
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
                        // Positioned(
                        //   top: 00,
                        //   right: 0,
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 10.0, horizontal: 10.0),
                        //     child: SizedBox(
                        //       width: 60,
                        //       child: TextButton(
                        //         onPressed: () {},
                        //         style: ButtonStyle(
                        //             shape: MaterialStateProperty.all<
                        //                     RoundedRectangleBorder>(
                        //                 RoundedRectangleBorder(
                        //                     borderRadius:
                        //                         BorderRadius.circular(5))),
                        //             backgroundColor:
                        //                 MaterialStateProperty.all<Color>(
                        //                     const Color(0xFFFF0000)),
                        //             foregroundColor:
                        //                 MaterialStateProperty.all<Color>(
                        //                     ColourTheme.black)),
                        //         child: const Text(
                        //           "⭐",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.white,
                        //               fontSize: 14),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
      carouselController: _controller,
    );
  }
}
