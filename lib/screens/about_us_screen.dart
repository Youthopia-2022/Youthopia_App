import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youthopia_2022_app/constants/gradient_color.dart';
import '../constants/color_theme.dart';
import '../services/team.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  double totalHeight = 0;
  @override
  void initState() {
    super.initState();
    double height = 0;
    for(int i = 0; i < Team.teams.length; i++) {
      height += 80;
      height += Team.teams[i].heads.length * 80;
      height += Team.teams[i].members.length * 80;
    }
    setState(() {
      totalHeight = height;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColourTheme.black,
        appBar: AppBar(
          backgroundColor: ColourTheme.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                          const Image(image: AssetImage('assets/aboutUs.png'))),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        'Made with ♥ in DIT',
                        style: TextStyle(
                          color: ColourTheme.white,
                          fontSize: 16,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: totalHeight,
                  child: ListView.builder(
                      itemCount: Team.teams.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              Team.teams[index].teamName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: (Team.teams[index].heads.length * 75.0),
                              child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: Team.teams[index].heads.length,
                                  itemBuilder:
                                      (BuildContext context, int headIndex) {
                                    return Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: const BoxDecoration(
                                                color: Color(0xFF222222)),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          Team
                                                              .teams[index]
                                                              .heads[headIndex]
                                                              .name,
                                                          style: TextStyle(
                                                              color: ColourTheme
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 22),
                                                        ),
                                                        Text(
                                                          '${Team.teams[index].heads[headIndex].branch} - ${Team.teams[index].heads[headIndex].year} year',
                                                          style: TextStyle(
                                                              color: ColourTheme
                                                                  .lightGrey,
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.public,
                                                      color: ColourTheme.white,
                                                      size: 25,
                                                    ),
                                                    onTap: () {
                                                      launchUrl(Uri.parse(Team
                                                          .teams[index]
                                                          .heads[headIndex]
                                                          .url));
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: (Team.teams[index].members.length * 80.0),
                              child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: Team.teams[index].members.length,
                                  itemBuilder:
                                      (BuildContext context, int memberIndex) {
                                    return Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: const BoxDecoration(
                                                color: Color(0xFF222222)),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          Team
                                                              .teams[index]
                                                              .members[
                                                                  memberIndex]
                                                              .name,
                                                          style: TextStyle(
                                                              color: ColourTheme
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 22),
                                                        ),
                                                        Text(
                                                          '${Team.teams[index].members[memberIndex].branch} - ${Team.teams[index].members[memberIndex].year} year',
                                                          style: TextStyle(
                                                              color: ColourTheme
                                                                  .lightGrey,
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.public,
                                                      color: ColourTheme.white,
                                                      size: 25,
                                                    ),
                                                    onTap: () {
                                                      launchUrl(Uri.parse(Team
                                                          .teams[index]
                                                          .members[memberIndex]
                                                          .url));
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
