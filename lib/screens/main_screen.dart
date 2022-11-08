import 'package:flutter/material.dart';
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
          child: (!isLoaded)
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    (MainEvents.starNight != null)
                        ? const HomePageContainer()
                        : Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Image(
                              //height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.9,
                              image: const AssetImage('assets/secret.png'),
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: (Sponsors.sponsors!.isEmpty)
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0,
                            )
                          : Column(children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 17),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: GradientText(
                                    "Sponsors",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 78,
                                child: ListView.builder(
                                  itemCount: Sponsors.sponsors!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 17),
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
                            ]),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 17),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GradientText(
                          "Featured Events",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
