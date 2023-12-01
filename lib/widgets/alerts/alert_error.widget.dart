import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final int seconds;

  const ErrorAlertDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      this.seconds = 10});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: seconds), () {
      Navigator.of(context).pop();
    });

    return AlertDialog(
      title: Column(
        children: [
          const Icon(Icons.error, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(title),
        ],
      ),
      content: Text(subtitle),
    );
  }
}
