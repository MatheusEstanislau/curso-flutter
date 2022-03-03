import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onPress;

  const Quiz(this.questions, this.selectedQuestion, this.onPress, {Key? key})
      : super(key: key);

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
        : [];

    final List<Widget> answersWidget = answers
        .map((e) => Answer(e['text'].toString(),
            () => onPress(int.parse(e['score'].toString()))))
        .toList();
    return Column(
      children: [
        Question(questions[selectedQuestion]['question'].toString()),
        ...answersWidget
      ],
    );
  }
}
