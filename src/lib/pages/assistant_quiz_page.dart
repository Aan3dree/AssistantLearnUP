import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../modules/assistant_quiz_brain.dart';

AssistantQuizBrain quizBrain = AssistantQuizBrain();

class AssistantQuizPage extends StatefulWidget {
  const AssistantQuizPage({Key? key}) : super(key: key);

  @override
  State<AssistantQuizPage> createState() => _AssistantQuizPageState();
}

class _AssistantQuizPageState extends State<AssistantQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz das Assistentes Virtuais'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  print('Choose 1');
                },
                child: Text(
                  quizBrain.getChoice(1),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  print('Choose 2');
                },
                child: Text(
                  quizBrain.getChoice(2),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  print('Choose 3');
                  setState(() {
                    quizBrain.nextQuestion();
                  });
                },
                child: Text(
                  quizBrain.getChoice(3),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
