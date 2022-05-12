import 'package:flutter/material.dart';
import 'sound_question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistant Learn\'Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SoundQuestionPage(),
    );
  }
}
