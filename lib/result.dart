import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result({this.totalScore, this.resetHandler});

  String get resultPhrase {
    String resultText;
    if (totalScore >= 300) {
      resultText = 'You are awesome and innocent!';
    } else if (totalScore >= 1500) {
      resultText = 'Pretty likeable!';
    } else if (totalScore >= 50) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // Text(
          //   'You did it!',
          //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          //   textAlign: TextAlign.center,
          // ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
