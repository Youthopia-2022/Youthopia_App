import 'package:flutter/material.dart';

class SponsorContainer extends StatelessWidget {
  const SponsorContainer({Key? key, required this.sponsorImage})
      : super(key: key);

  final String sponsorImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: const Color(0xFF121212),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.21,
            child: Image(
              image: AssetImage(sponsorImage),
            ),
          ),
        ),
      ),
    );
  }
}
