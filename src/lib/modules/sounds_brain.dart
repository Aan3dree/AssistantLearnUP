import '../models/sounds.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer player = AudioPlayer();
AudioCache cachePlayer = AudioCache(fixedPlayer: player);
bool isPlaying = false;

class SoundBrain {
  List<SoundQuestion> _soundData = [
    SoundQuestion(cachePlayer.play('sounds/pandeiro.mp3'),
        ['Alfaia', 'Atabaque', 'Pandeiro', 'Berinbal']),
  ];

  playSound() {
    if (!isPlaying) {
      _soundData[0].sound;
      isPlaying = true;
      stopSound();
    }
  }

  stopSound() {
    if (isPlaying) {
      player.onAudioPositionChanged.listen((Duration d) {
        if (d >= (const Duration(milliseconds: 5000))) {
          player.stop();
        }
        isPlaying = false;
      });
    }
  }

  getChoice(int index) {
    _soundData[0].choices[index - 1];
  }
}
