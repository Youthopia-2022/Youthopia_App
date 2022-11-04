import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageContainer extends StatelessWidget {
  HomePageContainer(
      {super.key,
      required this.branch,
      required this.name,
      this.instagramUrl,
      this.linkedinUrl});

  final String name;
  final String branch;
  Uri? linkedinUrl;
  Uri? instagramUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Expanded(
          child: Container(
            color: const Color(0xFF222222),
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
                                child: Text("2:00 pm",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF666666))),
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
                                          color: Color(0xFF666666))),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: Text("Ritviz",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF666666))),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
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
      ),
    );
  }
}
