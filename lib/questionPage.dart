import 'package:flutter/material.dart';
import './question.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int i = 0;

  List questions = [
    {
      "questionText": "What s your favourite pet!",
      "options": ["cheetah", "dog", "cat", "elephant"]
    },
    {
      "questionText": "What s your favourite food!",
      "options": ["pizza", "fry", "chicken", "biriyani"]
    },
    {
      "questionText": "What s your favourite sports!",
      "options": ["cricket", "football", "hockey", "badminton"]
    },
  ];

  Widget optionButtons(List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        for (String option in options)
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
                  if (i < questions.length - 1) {
                    i++;
                  }
                });
              },
              child: Text(option))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[i]['questionText']),
        optionButtons(questions[i]['options']),
      ],
    );
  }
}
