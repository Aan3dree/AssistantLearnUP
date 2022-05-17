import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import '../modules/sounds_brain.dart';

class SoundQuestionPage extends StatefulWidget {
  const SoundQuestionPage({Key? key}) : super(key: key);

  @override
  State<SoundQuestionPage> createState() => _SoundQuestionPageState();
}

AudioPlayer player = AudioPlayer();
AudioCache playerCache = AudioCache(fixedPlayer: player);
bool isPlaying = false;
void playSound() {
  isPlaying = true;
  playerCache.play('sounds/pandeiro.mp3');
  stopSound();
  player.onDurationChanged.listen((Duration d) {
    print('Max Duration: $d');
  });
  //Future.delayed(const Duration(milliseconds: 500));
  //player.stop();
  //playerCache.clear('sounds/pandeiro.mp3');
}

void stopSound() {
  player.onAudioPositionChanged.listen((Duration d) {
    if (d >= (const Duration(milliseconds: 5000))) {
      player.stop();
    }
    isPlaying = false;
  });
}

class _SoundQuestionPageState extends State<SoundQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text('Sound Quiz'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(120, 130, 120, 130),
              child: GestureDetector(
                onTap: () {
                  SoundBrain().playSound();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
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
                  SoundBrain().getChoice(1),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style:
                    TextButton.styleFrom(backgroundColor: Colors.blue.shade300),
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
                  SoundBrain().getChoice(2),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  print('questio3');
                },
                child: Text(
                  SoundBrain().getChoice(3),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style:
                    TextButton.styleFrom(backgroundColor: Colors.blue.shade500),
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
                  SoundBrain().getChoice(4),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
              ),
            ),
          ),
        ],
      ),
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
