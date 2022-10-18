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
                              child: const Text('New',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      const SizedBox(height: 20.0),
                      const Text('Big double cheeseburger',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20.0),
                      const Text(
                          'Marble beef, cheddar cheese, jalapeno pepper, pickled cucumber, lettuce, red onion, BBQ sauce',
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
                          Container(
                            child: Row(children: const <Widget>[
                              Icon(Icons.tag_rounded, color: Colors.white),
                              SizedBox(width: 5.0),
                              Text(
                                '\$5.42',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                          ),
                          const SizedBox(width: 30.0),
                          Container(
                            child: Row(children: const <Widget>[
                              Icon(Icons.add_box_outlined, color: Colors.white),
                              SizedBox(width: 5.0),
                              Text('320 g',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      SizedBox(
                        width: 380, // <-- Your width
                        height: 60, // <-- match-parent
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
                            'Taste it for \$5.42',
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

/* class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required int pageIndex,
  })  : _currentPageIndex = pageIndex,
        super(key: key);

  final int _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 30,
          color: Colors.black.withOpacity(.1),
        )
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.shoppingCart,
                text: 'My Cart',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              )
            ],
            selectedIndex: _currentPageIndex,
            onTabChange: (index) {
              (index == 1)
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyCart()))
                  : (index == 2)
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()))
                      : "";
            },
          ),
        ),
      ),
    );
  }
} */
