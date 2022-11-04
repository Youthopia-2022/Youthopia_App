import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.zero.eu/uploads/2022/02/party.png'),
                  fit: BoxFit.cover)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            FontAwesomeIcons.clock,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.017,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            //height: MediaQuery.of(context).size.height * 0.01,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "2:00 pm",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text("STAR NIGHT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'IBM Plex Sans')),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("By",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text("Ritviz",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                              const Icon(FontAwesomeIcons.calendarCheck,
                                  size: 20, color: Colors.white),
                              const Text(
                                '\t15 Nov 22',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
