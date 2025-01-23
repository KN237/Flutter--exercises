import 'dart:math';

import 'package:flutter/material.dart';

final random = Random();

class Dicey extends StatefulWidget {
  const Dicey({super.key, required this.title});
  final String title;

  @override
  State<Dicey> createState() => _DiceyState();
}

class _DiceyState extends State<Dicey> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
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
          spacing: 15,
          children: [
            Image.asset(
              'assets/images/dice-$number.png',
              width: 100,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  number = random.nextInt(6) + 1;
                });
              },
              child: Text(
                'Roll Dice',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
