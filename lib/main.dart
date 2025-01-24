import 'package:exercices/quizey/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String title = 'Quizey';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Quizey(title: title),
    ),
  );
}
