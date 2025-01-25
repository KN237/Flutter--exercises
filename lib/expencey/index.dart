import 'package:flutter/material.dart';

class Expencey extends StatelessWidget {
  const Expencey({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
