import 'package:assistant_learn_up/pages/assistant_quiz_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sound_quiz_page.dart';
import 'assistant_quiz_page.dart';
import 'learn_page.dart';
import '../services/httpHelper.dart';
import '../components/my_button.dart';

HttpHelper httpHelper = HttpHelper();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User? logedUser;

  Future getCurentUser() async {
    final user = await _auth.currentUser;
    try {
      logedUser = user;
      print(logedUser?.displayName);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurentUser().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(logedUser?.displayName);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Assistant Learn\'Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      _auth.signOut();
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bem vindo, ${logedUser?.displayName}',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                "O que você gostaria de fazer?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            MyButton(
                buttonColor: Colors.lightGreen,
                buttonLabel: 'Aprenda Assistentes Virtuais',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              LearnAssistantPage()));
                }),
            MyButton(
                buttonColor: Colors.lightBlue,
                buttonLabel: 'Quiz Assistentes Virtuais',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AssistantQuizPage()));
                }),
            MyButton(
                buttonColor: Colors.tealAccent,
                buttonLabel: 'Quiz Intrumentos Musicais',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SoundQuestionPage()));
                }),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
