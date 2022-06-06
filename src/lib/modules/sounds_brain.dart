import '../models/sounds.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer player = AudioPlayer();
AudioCache cachePlayer = AudioCache(fixedPlayer: player);
bool isPlaying = false;

class SoundBrain {
  int _soundNumber = 0;
  final List<SoundQuestion> _soundData = [
    SoundQuestion(cachePlayer.play('sounds/pandeiro.mp3'),
        ['Alfaia', 'Atabaque', 'Pandeiro', 'Berimbau']),
    SoundQuestion(cachePlayer.play('sounds/acordeon.mp3'),
        ['Berimbau', 'Zabumba', 'Tricórdio', 'Acordeon']),
    SoundQuestion(cachePlayer.play('sounds/harpa.mp3'),
        ['Saxsoprano', 'Teclado', 'Harpa', 'Flauta']),
    SoundQuestion(cachePlayer.play('sounds/alfaia.mp3'),
        ['Alfaia', 'Pandeiro', 'Tricórdio', 'Teclado']),
    SoundQuestion(cachePlayer.play('sounds/teclado.mp3'),
        ['Teclado', 'Atabaque', 'Guitarra', 'Violino']),
    SoundQuestion(cachePlayer.play('sounds/atabaque.mp3'),
        ['Pandeiro', 'Zabumba', 'Atabaque', 'Alfaia']),
    SoundQuestion(cachePlayer.play('sounds/violao.mp3'),
        ['Berimbau', 'Atabaque', 'Alfaia', 'Pandeiro']),
    SoundQuestion(cachePlayer.play('sounds/zabumba.mp3'),
        ['Harpa', 'Zabumba', 'Pandeiro', 'Alfaia']),
    SoundQuestion(cachePlayer.play('sounds/violino.mp3'),
        ['Violão', 'Guitarra', 'Violino', 'Teclado']),
    SoundQuestion(cachePlayer.play('sounds/berimbau.mp3'),
        ['Berimbau', 'Zabumba', 'Pandeiro', 'Atabaque']),
  ];

  bool getCorrectAnswer(int choice) {
    try {
      switch (choice) {
        case 1:
          if (_soundNumber == 0) {
            return false;
          } else if (_soundNumber == 1) {
            return false;
          } else if (_soundNumber == 2) {
            return false;
          } else if (_soundNumber == 3) {
            return true;
          } else if (_soundNumber == 4) {
            return true;
          } else if (_soundNumber == 5) {
            return false;
          } else if (_soundNumber == 6) {
            return false;
          } else if (_soundNumber == 7) {
            return false;
          } else if (_soundNumber == 8) {
            return false;
          } else if (_soundNumber == 9) {
            return true;
          }
          break;
        case 2:
          if (_soundNumber == 0) {
            return false;
          } else if (_soundNumber == 1) {
            return false;
          } else if (_soundNumber == 2) {
            return false;
          } else if (_soundNumber == 3) {
            return false;
          } else if (_soundNumber == 4) {
            return false;
          } else if (_soundNumber == 5) {
            return false;
          } else if (_soundNumber == 6) {
            return false;
          } else if (_soundNumber == 7) {
            return true;
          } else if (_soundNumber == 8) {
            return false;
          } else if (_soundNumber == 9) {
            return false;
          }
          break;
        case 3:
          if (_soundNumber == 0) {
            return true;
          } else if (_soundNumber == 1) {
            return false;
          } else if (_soundNumber == 2) {
            return true;
          } else if (_soundNumber == 3) {
            return false;
          } else if (_soundNumber == 4) {
            return false;
          } else if (_soundNumber == 5) {
            return true;
          } else if (_soundNumber == 6) {
            return false;
          } else if (_soundNumber == 7) {
            return false;
          } else if (_soundNumber == 8) {
            return true;
          } else if (_soundNumber == 9) {
            return false;
          }
          break;
        case 4:
          if (_soundNumber == 0) {
            return false;
          } else if (_soundNumber == 1) {
            return true;
          } else if (_soundNumber == 2) {
            return false;
          } else if (_soundNumber == 3) {
            return false;
          } else if (_soundNumber == 4) {
            return false;
          } else if (_soundNumber == 5) {
            return false;
          } else if (_soundNumber == 6) {
            return false;
          } else if (_soundNumber == 7) {
            return false;
          } else if (_soundNumber == 8) {
            return false;
          } else if (_soundNumber == 9) {
            return false;
          }
          break;
      }
    } catch (e) {
      print(e);
    } finally {
      return false;
    }
  }

  nextQuestion() {
    _soundNumber++;
  }

  playSound() {
    if (!isPlaying) {
      _soundData[_soundNumber].sound;
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
    _soundData[_soundNumber].choices[index - 1];
  }
}
