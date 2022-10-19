import "package:flutter/material.dart";
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1e2025),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: RawMaterialButton(
                      onPressed: () {},
                      constraints: const BoxConstraints(),
                      elevation: 2.0,
                      fillColor: const Color(0xff383c45),
                      padding: const EdgeInsets.all(10.0),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.close_outlined,
                          size: 25.0, color: Color(0xffe7e8e9)),
                    ),
                  ),
                  RotationTransition(
                      turns: const AlwaysStoppedAnimation(-4 / 360),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 40.0, left: 0.0, right: 45.0, bottom: 60.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: const Image(
                            image: AssetImage('assets/testimg.png'),
                            height: 300.0,
                          ),
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff7a3dff)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ))),
                              child: const Text('ACM-DITU',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)))),
                      const SizedBox(height: 20.0),
                      const Text('Event Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20.0),
                      const Text('Event Description',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff454953),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(children: const <Widget>[
                            Icon(Icons.currency_rupee, color: Colors.white),
                            SizedBox(width: 5.0),
                            Text(
                              '30',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                          const SizedBox(width: 30.0),
                          Row(children: const <Widget>[
                            Icon(Icons.location_on, color: Colors.white),
                            SizedBox(width: 5.0),
                            Text('VED 505',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      SizedBox(
                        width: 380,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/order_screen');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff7a3dff)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: const Text(
                            'Register Yourself',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                ],
              )),
        ));
  }
}
