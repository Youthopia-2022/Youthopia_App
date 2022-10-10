import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Home SCREEN")),
    );
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
