import 'package:assistant_learn_up/pages/assistant_quiz_page.dart';
import 'package:assistant_learn_up/pages/learn_page.dart';
import 'package:assistant_learn_up/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options';
import 'pages/register_page.dart';
import 'pages/sound_quiz_page.dart';
import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistant Learn\'Up',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.teal),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/home': (context) => HomePage(),
        '/sound_quiz': (context) => SoundQuestionPage(),
        '/assistant_quiz': (context) => AssistantQuizPage(),
        '/learn': (context) => LearnAssistantPage()
      },
    );
  }
}
