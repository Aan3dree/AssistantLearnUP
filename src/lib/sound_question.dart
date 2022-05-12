import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundQuestionPage extends StatefulWidget {
  const SoundQuestionPage({Key? key}) : super(key: key);

  @override
  State<SoundQuestionPage> createState() => _SoundQuestionPageState();
}

class _SoundQuestionPageState extends State<SoundQuestionPage> {
  void playSound() {
    final player = AudioCache();
    player.play('sounds/pandeiro.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(120, 160, 120, 160),
            child: GestureDetector(
              onTap: () {
                playSound();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  FontAwesomeIcons.microphone,
                  color: Colors.white,
                  size: 50,
                ),
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
                print('questio1');
              },
              child: Text(
                'question 1',
                style: TextStyle(color: Colors.white, fontSize: 18),
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
                print('question2');
              },
              child: Text(
                'question 2',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
            ),
          ),
        ),
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  void playSound() {
    final player = AudioCache();
    player.play('sounds/pandeiro.wav');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: playSound,
      child: Text('play'),
    );
  }
}
