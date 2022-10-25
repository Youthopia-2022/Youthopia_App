import "package:flutter/material.dart";

import '../constants/gradient_color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161515),
      body: SingleChildScrollView(
        child: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.1, 0.6, 0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFD9D9D9),
                    Color(0xFF323232),
                    Color.fromARGB(255, 22, 21, 21),
                  ],
                ),
              ),
              //color: const Color.fromARGB(255, 43, 40, 40),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 20, 19, 19),
                          ),
                          iconSize: 30,
                        ),
                        const Image(
                          image: AssetImage('assets/DITU_Highres_WHITE.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 420,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        GradientText(
                          'Robo Soccer',
                          style: TextStyle(fontSize: 38),
                        ),
                        Image(
                          image: AssetImage(
                            'assets/CodeGenX-logo-W 1.png',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Chanakya Lawn",
                          style: TextStyle(
                              color: Color(0xFF1BBEE9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Date",
                                style: TextStyle(
                                  color: Color(0xFF1BBEE9),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "22/09/2022",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Time",
                                style: TextStyle(
                                  color: Color(0xFF1BBEE9),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "10:45 am",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: Color(0xFF1bbee9),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "₹ 10",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "GPF",
                                style: TextStyle(
                                  color: Color(0xFF1BBEE9),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Description",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 225, 235, 238),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 24.0,
                        ),
                        label: const Text(
                          'Register Now',
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ))) // <-- Text
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
