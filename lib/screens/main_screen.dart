import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/services/events.dart';
import 'package:youthopia_2022_app/widgets/home_page_container.dart';
import '../constants/gradient_color.dart';
import '../services/sponsors.dart';
import '../widgets/horizontal_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoaded = false;
  List? techEvents;
  List? culturalEvents;
  List? informalEvents;
  List? debateEvents;
  List? artsEvents;
  late final Event event;

  @override
  void initState() {
    super.initState();

    setState(() {
      techEvents = Event.techEvents;
      culturalEvents = Event.culturalEvents;
      informalEvents = Event.informalEvents;
      debateEvents = Event.debateEvents;
      artsEvents = Event.artsEvents;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourTheme.black,
      appBar: AppBar(
        //toolbarHeight: 70,
        leadingWidth: double.maxFinite,
        backgroundColor: ColourTheme.black,
        leading: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: double.maxFinite,
          child: Image.asset(
            'assets/yss.png',
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: /* (!isLoaded)
              ? const Center(child: CircularProgressIndicator())
              : */
              Column(
            children: [
              (MainEvents.starNight != null)
                  ? const HomePageContainer()
                  : Stack(alignment: Alignment.center, children: [
                      const Image(
                          height: 220,
                          image: AssetImage('assets/star_night_reveal.png')),
                      Positioned(
                          top: 30,
                          child: Text(
                            'Star Night',
                            style: GoogleFonts.kaushanScript(
                              color: ColourTheme.white,
                              fontSize: 50
                            ),
                          )),
                Positioned(
                    top: 90,
                    child: Text(
                      '?',
                      style: GoogleFonts.kaushanScript(
                          color: ColourTheme.white,
                          fontSize: 50
                      ),
                    )),
                Positioned(
                    top: 150,
                    child: Text(
                      'WILL BE REVEALED ON 15 NOV',
                      style: GoogleFonts.merriweather(
                          color: ColourTheme.white,
                          fontSize: 20
                      )
                    )),
                    ]),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GradientText(
                    "Sponsors",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 78,
                child: ListView.builder(
                  itemCount: Sponsors.sponsors!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 17),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Container(
                          color: const Color(0xFF121212),
                          child: Image(
                            image: NetworkImage(
                              Sponsors.sponsors![index].iconUrl,
                            ),
                            height: 70,
                            width: 70,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GradientText(
                    "Live Events",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Carousel(
                LiveEvents.liveEvents!,
                auto: true,
                enlarge: true,
                loop: true,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* 
ListView(
              children: <Widget>[
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
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SeeMoreScreen(techEvents!)));
                        },
                        child: const GradientText('See More',
                            //gradient: ColourTheme.primaryGradient,
                            style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                        itemCount: techEvents?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                      techEvents?[index].eventPosterUrl,
                                      fit: BoxFit.cover,
                                      width: 300.0)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          Home(techEvents?[index])));
                            },
                          );
                        })),
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
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SeeMoreScreen(culturalEvents!)));
                        },
                        child: const GradientText('See More',
                            //gradient: ColourTheme.primaryGradient,
                            style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                        itemCount: culturalEvents?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                      culturalEvents?[index].eventPosterUrl,
                                      fit: BoxFit.cover,
                                      width: 300.0)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          Home(culturalEvents?[index])));
                            },
                          );
                        })),
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
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SeeMoreScreen(informalEvents!)));
                        },
                        child: const GradientText('See More',
                            //gradient: ColourTheme.primaryGradient,
                            style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                        itemCount: informalEvents?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                      informalEvents?[index].eventPosterUrl,
                                      fit: BoxFit.cover,
                                      width: 300.0)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          Home(informalEvents?[index])));
                            },
                          );
                        })),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Literary',
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SeeMoreScreen(debateEvents!)));
                        },
                        child: const GradientText('See More',
                            //gradient: ColourTheme.primaryGradient,
                            style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                        itemCount: debateEvents?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                      debateEvents?[index].eventPosterUrl,
                                      fit: BoxFit.cover,
                                      width: 300.0)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          Home(debateEvents?[index])));
                            },
                          );
                        })),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Fine Arts',
                        style:
                            TextStyle(color: ColourTheme.white, fontSize: 26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      SeeMoreScreen(artsEvents!)));
                        },
                        child: const GradientText('See More',
                            //gradient: ColourTheme.primaryGradient,
                            style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                        itemCount: artsEvents?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                      artsEvents?[index].eventPosterUrl,
                                      fit: BoxFit.cover,
                                      width: 300.0)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          Home(artsEvents?[index])));
                            },
                          );
                        })),
              ],
            ), */
