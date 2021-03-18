import 'package:flutter/material.dart';
import 'package:questionAnswers/questionPage.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questionire"),
        centerTitle: true,
      ),
      body: QuestionPage(),
    );
  }
}
