import 'package:flutter/material.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({super.key, required this.branch, required this.name});

  final String name;
  final String branch;

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
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
            ),
          ),
        ),
      ),
    );
  }
}
