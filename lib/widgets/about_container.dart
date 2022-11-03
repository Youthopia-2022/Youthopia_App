import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NameContainer extends StatelessWidget {
  NameContainer(
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
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          color: const Color(0xFF222222),
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width - 35,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(branch,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666))),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        launchUrl(linkedinUrl!);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        launchUrl(instagramUrl!);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
