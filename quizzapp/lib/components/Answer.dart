import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String title;
  final void Function() onClick;

  const Answer(this.title, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(onPressed: onClick, child: Text(title)));
  }
}
