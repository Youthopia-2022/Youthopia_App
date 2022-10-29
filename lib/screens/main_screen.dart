import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/constants/color_theme.dart';
import 'package:youthopia_2022_app/constants/gradient_color.dart';
import 'package:youthopia_2022_app/screens/see_more_screen.dart';
import 'package:youthopia_2022_app/widgets/horizontal_carousel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youthopia_2022_app/services/events.dart';

import 'home_screen.dart';

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

  bool isLoaded = false;
  List? techEvents;
  List? culturalEvents;
  List? informalEvents;
  List? debateEvents;
  List? artsEvents;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Event toEvent(Map<String, dynamic> result) {

    final String eventPosterUrl = Supabase.instance.client
        .storage
        .from('event-posters')
        .getPublicUrl(result['event_id']);

    int hr = int.parse(result['event_time'].substring(0,2));
    int min = int.parse(result['event_time'].substring(3,5));
    return Event(
      result['event_id'],
      result['event_name'],
      result['event_venue'],
        TimeOfDay(hour: hr, minute: min),
      DateTime.parse(result['event_date']),
      result['event_fees'],
      result['event_description'],
      result['event_isTeam'],
      eventPosterUrl
    );
  }

  Future<void> _getData() async {
    try {
      final technical = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Technical');
      techEvents = technical.map((e) => toEvent(e)).toList();

      final cultural = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Cultural');
      culturalEvents = cultural.map((e) => toEvent(e)).toList();

      final informal = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Informal');
      informalEvents = informal.map((e) => toEvent(e)).toList();

      final debate = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Debate');
      debateEvents = debate.map((e) => toEvent(e)).toList();

      final arts = await Supabase.instance.client
          .from('events')
          .select()
          .eq('event_category', 'Fine Arts');
      artsEvents = arts.map((e) => toEvent(e)).toList();

    } on PostgrestException catch (error) {
      debugPrint(error.toString());
    }

    setState(() {
      isLoaded = true;
    });
  }

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
      body: (!isLoaded) ? const Center(child: CircularProgressIndicator()) :
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
                  style: TextStyle(color: ColourTheme.white, fontSize: 26),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeMoreScreen(techEvents!)));
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          child: Image.network(techEvents?[index].eventPosterUrl,
                              fit: BoxFit.cover, width: 300.0)),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home(techEvents?[index])));
                    },
                  );
                })
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
                  style: TextStyle(color: ColourTheme.white, fontSize: 26),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeMoreScreen(culturalEvents!)));
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                            child: Image.network(culturalEvents?[index].eventPosterUrl,
                                fit: BoxFit.cover, width: 300.0)),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  Home(culturalEvents?[index])));
                      },
                    );
                  })
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
                  style: TextStyle(color: ColourTheme.white, fontSize: 26),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeMoreScreen(informalEvents!)));
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                            child: Image.network(informalEvents?[index].eventPosterUrl,
                                fit: BoxFit.cover, width: 300.0)),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  Home(informalEvents?[index])));
                      },
                    );
                  })
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
                  style: TextStyle(color: ColourTheme.white, fontSize: 26),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeMoreScreen(debateEvents!)));
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                            child: Image.network(debateEvents?[index].eventPosterUrl,
                                fit: BoxFit.cover, width: 300.0)),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home(debateEvents?[index])));
                      },
                    );
                  })
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
                  'Fine Arts',
                  style: TextStyle(color: ColourTheme.white, fontSize: 26),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeMoreScreen(artsEvents!)));
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                            child: Image.network(artsEvents?[index].eventPosterUrl,
                                fit: BoxFit.cover, width: 300.0)),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home(artsEvents?[index])));
                      },
                    );
                  })
          ),
        ],
      ),
    );
  }
}