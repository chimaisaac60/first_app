import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;

  Result(this.totalScore, this.reset);

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You are awesome';
    } else if (totalScore <= 16) {
      resultText = 'You are weird';
    } else if (totalScore <= 20) {
      resultText = 'you are great';
    } else {
      resultText = 'You are Ramos';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        FloatingActionButton(
          child: Text('reset'),
          onPressed: reset,
        )
      ]),
    );
  }
}
