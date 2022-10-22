import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youthopia_2022_app/constants/gradient_color.dart';
import 'package:youthopia_2022_app/widgets/horizontal_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final List<String> imgList = [
  'assets/sample 1.jpg',
  'assets/sample 2.jpg',
  'assets/sample 3.jpg',
  'assets/sample 4.jpg',
  'assets/sample 5.jpg'
];

class _MainScreenState extends State<MainScreen> {
  /*int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imgList
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
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
      .toList();*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.black,
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 70,
        backgroundColor: ColourTheme.black,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Image(
            image: AssetImage('assets/circle.png'),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // CarouselSlider(
          //   options: CarouselOptions(
          //       autoPlay: true,
          //       height: 200,
          //       aspectRatio: 2.0,
          //       enlargeCenterPage: true,
          //       onPageChanged: (index, reason) {
          //         setState(() {
          //           _current = index;
          //         });
          //       }),
          //   items: imageSliders,
          //   carouselController: _controller,
          // ),
          Carousel(
              imgList,
              auto: true,
              enlarge: true,
              loop: true,
              height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    'Technical',
                  style: TextStyle(
                    color: ColourTheme.white,
                    fontSize: 26
                  ),
                ),
                TextButton(
                  onPressed: () {  },
                  child: GradientText(
                    'See More',
                    gradient: ColourTheme.primaryGradient,
                    style: const TextStyle(
                      fontSize: 20
                    )
                  ),)
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Carousel(
            imgList,
            auto: false,
            enlarge: false,
            loop: false,
            height: 150
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Cultural',
                  style: TextStyle(
                      color: ColourTheme.white,
                      fontSize: 26
                  ),
                ),
                TextButton(
                  onPressed: () {  },
                  child: GradientText(
                      'See More',
                      gradient: ColourTheme.primaryGradient,
                      style: const TextStyle(
                          fontSize: 20
                      )
                  ),)
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Carousel(
            imgList,
            auto: false,
            enlarge: false,
            loop: false,
              height: 150
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Informal',
                  style: TextStyle(
                      color: ColourTheme.white,
                      fontSize: 26
                  ),
                ),
                TextButton(
                  onPressed: () {  },
                  child: GradientText(
                      'See More',
                      gradient: ColourTheme.primaryGradient,
                      style: const TextStyle(
                          fontSize: 20
                      )
                  ),)
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Carousel(
            imgList,
            auto: false,
            enlarge: false,
            loop: false,
              height: 150
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Debate',
                  style: TextStyle(
                      color: ColourTheme.white,
                      fontSize: 26
                  ),
                ),
                TextButton(
                  onPressed: () {  },
                  child: GradientText(
                      'See More',
                      gradient: ColourTheme.primaryGradient,
                      style: const TextStyle(
                          fontSize: 20
                      )
                  ),)
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Carousel(
            imgList,
            auto: false,
            enlarge: false,
            loop: false,
              height: 150
          ),
        ],
      ),
    );
  }
}
