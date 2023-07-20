import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    void pressEvent({bool isLeft = false}) {
      setState(() {
        if (isLeft) {
          leftDiceNumber = Random().nextInt(6) + 1;
        } else {
          rightDiceNumber = Random().nextInt(6) + 1;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      pressEvent(isLeft: true);
                    },
                    child: Image(
                      image: AssetImage('images/dice$leftDiceNumber.png'),
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      pressEvent(isLeft: false);
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNumber.png'),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
