import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/color_theme.dart';

class Carousel extends StatefulWidget {
  const Carousel(
    this.imgList,
     {
    super.key,
       required this.auto,
       required this.enlarge,
       required this.loop,
       required this.height
  });
  final List<String> imgList;
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
      items: widget.imgList
          .map((item) => Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 00,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(textAlign: TextAlign.left,
                          text: const TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(
                                Icons.event_available_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                            alignment: PlaceholderAlignment.middle
                          ),
                          TextSpan(
                            text: ' Date'
                          )
                        ],
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const Text(
                        'Event Name',
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Positioned(
                top: 00,
                left: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(textAlign: TextAlign.left,
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.schedule,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    alignment: PlaceholderAlignment.middle
                                ),
                                TextSpan(
                                    text: ' Time'
                                )
                              ],
                              style:  TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    )
                ),
              ),
              Positioned(
                top: 00,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: SizedBox(
                      width: 60,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColourTheme.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                ColourTheme.black)),
                        child: const Text(
                          "LIVE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                ),
              )
            ],
          ),
        ),
      ))
          .toList(),
      carouselController: _controller,
    );
  }
}
