import 'package:flutter/material.dart';
import 'package:questionAnswers/questionPage.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
