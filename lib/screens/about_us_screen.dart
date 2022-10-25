import 'package:flutter/material.dart';
import 'package:youthopia_2022_app/constants/about_container.dart';
import 'package:youthopia_2022_app/constants/gradient_color.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              child: Center(
                child: Image(
                  image: AssetImage('assets/aboutUs.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GradientText(
                    "Conveners",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GradientText(
                    "Designing Team",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GradientText(
                    "Designing Team Members",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GradientText(
                    "Development Team",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GradientText(
                    "Development Team Members",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
            const NameContainer(branch: "branch", name: "name"),
          ],
        ),
      ),
    );
  }
}
