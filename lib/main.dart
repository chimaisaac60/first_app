import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;


  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

  }

   _reset(){
     if (_questionIndex > 0) {
       setState(() {
         _questionIndex = 0;
         _totalScore = 0;
       });
     }
     return _questionIndex;
  }

  final _questions = const [
    {
      'questionText': "what's your favourite color?",
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'White', 'score': 2},
        {'text': 'Red', 'score': 10},
        {'text': 'Yellow', 'score': 7}
      ],
    },
    {
      'questionText': "what's your favourite animal?",
      'answers': [
        {'text': 'Snake', 'score': 1},
        {'text': 'Cat', 'score': 2},
        {'text': 'Dog', 'score': 10},
        {'text': 'Chicken', 'score': 7}
      ],
    },
    {
      'questionText': "who's your favorite instructor?",
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Ramos', 'score': 50},
        {'text': 'Pain', 'score': 10},
        {'text': 'chukz', 'score': 7}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('my First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                reset: _reset,
              )
            : Result(_totalScore, _reset,),
      ),
    );
  }
}