import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// _ is define for private class
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite foods ? ',
      'answers': [
        {'text': 'Rendang', 'score': 100},
        {'text': 'Pecel Ayam', 'score': 80},
        {'text': 'Nasi Goreng', 'score': 60},
        {'text': 'Ayam Sayur', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite movie ? ',
      'answers': [
        {'text': 'Star Wars', 'score': 100},
        {'text': 'Captain America', 'score': 80},
        {'text': 'Iron Man', 'score': 60},
        {'text': 'Civil Wars', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite color ? ',
      'answers': [
        {'text': 'Blue', 'score': 100},
        {'text': 'Red', 'score': 80},
        {'text': 'Yellow', 'score': 60},
        {'text': 'Green', 'score': 40},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                totalScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
