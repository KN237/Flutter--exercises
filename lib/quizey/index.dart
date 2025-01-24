import 'package:exercices/quizey/questions.dart';
import 'package:flutter/material.dart';

import 'helpers.dart';

final white = Colors.white;

class Quizey extends StatefulWidget {
  const Quizey({super.key, required this.title});
  final String title;

  @override
  State<Quizey> createState() => _QuizeyState();
}

class _QuizeyState extends State<Quizey> {
  late List<Widget> currentPage;
  int currentIndex = 0;
  int currentPageIndex = 0;
  List<String> answers = [];

  void answerQuestion(String answer) {
    if (currentIndex < questions.length - 1) {
      answers.add(answer);

      currentIndex++;
    } else if (currentIndex == questions.length - 1) {
      if (answers.length != questions.length) {
        answers.add(answer);
        currentPageIndex = 3;
      }
    }

    setState(() {});
  }

  void changeIndex(int number) {
    setState(() {
      currentPageIndex = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentPageIndex == 0) {
      answers = [];
      currentIndex = 0;
      currentPage = titlePage(changeIndex);
    } else if (currentPageIndex == 1) {
      currentPage = questionsPage(currentIndex, answerQuestion);
    } else {
      currentPage = resultPage(answers, changeIndex);
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0XFF1d0268), Color(0XFF300580)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 50,
          children: currentPage,
        ),
      ),
    );
  }
}
