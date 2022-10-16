import 'package:flutter/material.dart';

class AlertUI extends StatelessWidget {
  final String title;
  const AlertUI(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: Text(title),
      actions: [
        MaterialButton(
            onPressed: () {
          Navigator.of(context).pop();
        },
          child: const Text('Okay'),
        )
      ],
    );
  }
}
