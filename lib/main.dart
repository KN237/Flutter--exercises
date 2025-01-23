import 'package:exercices/dicey/index.dart';
import 'package:flutter/material.dart';

String title = 'Dicey';

void main() {
  runApp(
    MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Dicey(title: title),
    ),
  );
}
