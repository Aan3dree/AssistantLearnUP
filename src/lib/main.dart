import 'package:flutter/material.dart';
import 'pages/sound_quiz_page.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistant Learn\'Up',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.teal),
      home: const HomePage(),
    );
  }
}
