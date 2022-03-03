import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  void Function() onPress;

  Result({required this.score, required this.onPress});

  String get finishPhrase {
    if (score < 8) {
      return "Congratulations";
    } else if (score < 12) {
      return "You are good";
    } else if (score < 16) {
      return "Impressive";
    } else {
      return "Jedi Level";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Text(finishPhrase, style: const TextStyle(fontSize: 28)),
      ),
      TextButton(
          child: const Text("Reiniciar ?", style: TextStyle(fontSize: 18)),
          onPressed: onPress)
    ]);
  }
}
