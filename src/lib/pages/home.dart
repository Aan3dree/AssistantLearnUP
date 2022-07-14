import 'package:assistant_learn_up/pages/assistant_quiz_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import 'sound_quiz_page.dart';
import 'assistant_quiz_page.dart';
import 'instruments_page.dart';
import 'learn_page.dart';
import '../services/httpHelper.dart';
import '../components/my_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

HttpHelper httpHelper = HttpHelper();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  User? logedUser;
  GoogleSignInAccount? logedGoogleUser;

  Future getCurentUser() async {
    final user = await _auth.currentUser;
    final googleUser = await GoogleSignIn().currentUser;
    try {
      logedUser = user;
      logedGoogleUser = googleUser;
      print(logedUser?.displayName);
      print(logedGoogleUser?.displayName);
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
  void dispose() {
    super.dispose();
    _auth.signOut();
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kHomeTitle,
                IconButton(
                    onPressed: () {
                      _auth.signOut();
                      Navigator.popAndPushNamed(context, '/login');
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logedGoogleUser?.displayName != null
                      ? Text(
                          'Olá, ${logedGoogleUser?.displayName}',
                          style: kUserNameStyle,
                        )
                      : Text(
                          'Bem vindo, ${logedUser?.displayName}',
                          style: kUserNameStyle,
                        ),
                ],
              ),
            ),
            kHomeMessage,
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
                buttonColor: Colors.teal.shade500,
                buttonLabel: 'Conheça Instrumentos Musicais',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              InstrumentPage()));
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
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
