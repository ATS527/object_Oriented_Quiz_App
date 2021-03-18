import 'package:flutter/material.dart';
import './question.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int i = 0;
  int totalScore = 0;
  String get resultText {
    String result;

    if (totalScore > 100)
      result = 'You are Awesome....';
    else if (totalScore > 50)
      result = 'You are good enough';
    else if (totalScore < 50) result = 'You are bad';
    return result;
  }

  List questions = <Map>[
    {
      "questionText": "What s your favourite pet!",
      "answers": [
        {"text": "cheetah", "score": 32},
        {"text": "dog", "score": 20},
        {"text": "cat", "score": 10},
        {"text": "elephant", "score": 0}
      ],
    },
    {
      "questionText": "What s your favourite food!",
      "answers": [
        {"text": "pizza", "score": 20},
        {"text": "fry", "score": 10},
        {"text": "chicken", "score": 40},
        {"text": "biriyani", "score": 0}
      ],
    },
    {
      "questionText": "What s your favourite sports!",
      "answers": [
        {"text": "cricket", "score": 5},
        {"text": "football", "score": 40},
        {"text": "hockey", "score": 20},
        {"text": "badminton", "score": 0}
      ],
    },
  ];

  Widget optionButtons(List<Map> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        for (Map options in options)
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.grey;
                    return Colors.blue; // Use the component's default.
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  totalScore += options["score"];
                  i++;
                });
              },
              child: Text(options["text"]))
      ],
    );
  }

  void restartQuiz() {
    i = 0;
    totalScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: i < questions.length
          ? Column(
              children: <Widget>[
                Question(questions[i]['questionText']),
                optionButtons(questions[i]['answers']),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Your Score is $totalScore !!!\n $resultText",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        restartQuiz();
                      });
                    },
                    child: Text("Restart"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.grey;
                          return Colors.green; // Use the component's default.
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
