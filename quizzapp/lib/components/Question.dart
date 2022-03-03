import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String title;

  const Question(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(title,
            style: const TextStyle(fontSize: 28), textAlign: TextAlign.center));
  }
}
