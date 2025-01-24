import 'package:exercices/quizey/questions.dart';
import 'package:flutter/material.dart';

final white = Colors.white;

List<Widget> titlePage(Function(int) goToPage) {
  return [
    Image.asset(
      'assets/images/quiz-logo.png',
      width: 300,
      color: white.withValues(alpha: 0.5),
    ),
    Text(
      'Learn Flutter The Fun Way!',
      style: TextStyle(
        fontSize: 17,
        color: white.withValues(alpha: 0.7),
      ),
    ),
    TextButton.icon(
      onPressed: () {
        goToPage(1);
      },
      icon: Icon(
        Icons.arrow_right_alt,
        color: white,
      ),
      label: Text(
        'Start Quiz',
        style: TextStyle(color: white.withValues(alpha: 0.9), fontSize: 14),
      ),
    )
  ];
}

List<Widget> questionsPage(int index, void Function(String) callback) {
  List<String> answers = List.from(questions[index].answers);
  answers.shuffle();
  return [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Text(
        questions[index].question,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: white.withValues(alpha: 0.7),
        ),
      ),
    ),
    Column(
      spacing: 5,
      children: [
        for (int i = 0; i < answers.length; i++)
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                callback(answers[i]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF16004F),
              ),
              child: Text(
                answers[i],
                textAlign: TextAlign.center,
                style: TextStyle(color: white),
              ),
            ),
          ),
      ],
    )
  ];
}

List<Widget> resultPage(List<String> answers, Function(int) goToPage) {
  int correctAnswers = 0;
  for (var i = 0; i < answers.length; i++) {
    if (answers[i] == questions[i].answers[0]) {
      correctAnswers++;
    }
  }
  return [
    Text(
      'You Answered $correctAnswers Out Of ${questions.length} Questions Correctly !',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        color: white.withValues(alpha: 0.7),
      ),
    ),
    SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 20,
            children: [
              for (var i = 0; i < answers.length; i++)
                Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      backgroundColor: answers[i] == questions[i].answers[0]
                          ? const Color.fromARGB(255, 193, 243, 219)
                          : const Color.fromARGB(255, 235, 187, 187),
                      child: Text((i + 1).toString()),
                    ),
                    SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questions[i].question,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 13,
                              color: white.withValues(alpha: 0.7),
                            ),
                          ),
                          Text(
                            answers[i],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 13,
                              color: answers[i] == questions[i].answers[0]
                                  ? Colors.greenAccent.withValues(alpha: 0.7)
                                  : Colors.redAccent.withValues(alpha: 0.7),
                            ),
                          ),
                          Text(
                            questions[i].answers[0],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.greenAccent.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    ),
    TextButton.icon(
      onPressed: () {
        goToPage(0);
      },
      icon: Icon(
        Icons.arrow_right_alt,
        color: white,
      ),
      label: Text(
        'Restart Quiz!',
        style: TextStyle(color: white.withValues(alpha: 0.9), fontSize: 14),
      ),
    )
  ];
}
