import 'package:flutter/material.dart';
import 'package:quizzapp/components/Answer.dart';
import 'package:quizzapp/components/Question.dart';
import 'package:quizzapp/components/Quiz.dart';
import 'package:quizzapp/components/Result.dart';

void main() {
  runApp(Quizzapp());
}

class QuizzappState extends State<Quizzapp> {
  var selectedAnswer = 0;
  var totalScore = 0;

  final questions = [
    {
      "question": "Whats your favorite color ?",
      "answers": [
        {"text": "Blue", "score": 10},
        {"text": "Green", "score": 5},
        {"text": "Yellow", "score": 3},
        {"text": "Red", "score": 1}
      ]
    },
    {
      "question": "Whats your favorite animal ?",
      "answers": [
        {"text": "Lion", "score": 10},
        {"text": "Elephant", "score": 5},
        {"text": "Zebra", "score": 3},
        {"text": "Snake", "score": 1}
      ]
    },
    {
      "question": "Whats your favorite teacher ?",
      "answers": [
        {"text": "Matheus", "score": 10},
        {"text": "Leo", "score": 5},
        {"text": "Joao", "score": 3},
        {"text": "Victor", "score": 1}
      ]
    }
  ];

  void handleAnswer(int score) {
    if (hasQuestion) {
      setState(() {
        selectedAnswer += 1;
        totalScore += score;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedAnswer = 0;
      totalScore = 0;
    });
  }

  bool get hasQuestion {
    return selectedAnswer < questions.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Quizzapp'),
      ),
      body: hasQuestion
          ? Quiz(questions, selectedAnswer, handleAnswer)
          : Result(score: totalScore, onPress: resetQuiz),
    ));
  }
}

class Quizzapp extends StatefulWidget {
  @override
  QuizzappState createState() {
    return QuizzappState();
  }
}
