import '../models/sound_question.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer player = AudioPlayer();
AudioCache cachePlayer = AudioCache(fixedPlayer: player);
bool isPlaying = false;

//cachePlayer.play('sounds/pandeiro.mp3'
class SoundBrain {
  int _soundNumber = 0;
  final List<SoundQuestion> _soundData = [
    SoundQuestion('sounds/pandeiro.mp3',
        ['Alfaia', 'Atabaque', 'Pandeiro', 'Berimbau'], 1),
    SoundQuestion('sounds/acordeon.mp3',
        ['Berimbau', 'Zabumba', 'Tricórdio', 'Acordeon'], 2),
    SoundQuestion(
        'sounds/harpa.mp3', ['Saxsoprano', 'Teclado', 'Harpa', 'Flauta'], 3),
    SoundQuestion(
        'sounds/alfaia.mp3', ['Alfaia', 'Pandeiro', 'Tricórdio', 'Teclado'], 4),
    SoundQuestion('sounds/teclado.mp3',
        ['Teclado', 'Atabaque', 'Guitarra', 'Violino'], 5),
    SoundQuestion('sounds/atabaque.mp3',
        ['Pandeiro', 'Zabumba', 'Atabaque', 'Alfaia'], 6),
    SoundQuestion(
        'sounds/violao.mp3', ['Berimbau', 'Atabaque', 'Alfaia', 'Pandeiro'], 7),
    SoundQuestion(
        'sounds/zabumba.mp3', ['Harpa', 'Zabumba', 'Pandeiro', 'Alfaia'], 8),
    SoundQuestion(
        'sounds/violino.mp3', ['Violão', 'Guitarra', 'Violino', 'Teclado'], 9),
    SoundQuestion('sounds/berimbau.mp3',
        ['Berimbau', 'Zabumba', 'Pandeiro', 'Atabaque'], 10),
  ];

  bool getCorrectAnswer(int choice) {
    bool isCorrect = false;

    try {
      switch (choice) {
        case 1:
          if (_soundNumber == 0) {
            isCorrect = false;
          } else if (_soundNumber == 1) {
            isCorrect = false;
          } else if (_soundNumber == 2) {
            isCorrect = false;
            return isCorrect;
          } else if (_soundNumber == 3) {
            isCorrect = true;
          } else if (_soundNumber == 4) {
            isCorrect = true;
          } else if (_soundNumber == 5) {
            isCorrect = false;
          } else if (_soundNumber == 6) {
            isCorrect = false;
          } else if (_soundNumber == 7) {
            isCorrect = false;
          } else if (_soundNumber == 8) {
            isCorrect = false;
          } else if (_soundNumber == 9) {
            isCorrect = true;
          }
          break;
        case 2:
          if (_soundNumber == 0) {
            isCorrect = false;
          } else if (_soundNumber == 1) {
            isCorrect = false;
          } else if (_soundNumber == 2) {
            isCorrect = false;
          } else if (_soundNumber == 3) {
            isCorrect = false;
          } else if (_soundNumber == 4) {
            isCorrect = false;
          } else if (_soundNumber == 5) {
            isCorrect = false;
          } else if (_soundNumber == 6) {
            isCorrect = false;
          } else if (_soundNumber == 7) {
            isCorrect = false;
          } else if (_soundNumber == 8) {
            isCorrect = false;
          } else if (_soundNumber == 9) {
            isCorrect = false;
          }
          break;
        case 3:
          if (_soundNumber == 0) {
            isCorrect = true;
          } else if (_soundNumber == 1) {
            isCorrect = false;
          } else if (_soundNumber == 2) {
            isCorrect = true;
          } else if (_soundNumber == 3) {
            isCorrect = false;
          } else if (_soundNumber == 4) {
            isCorrect = false;
          } else if (_soundNumber == 5) {
            isCorrect = true;
          } else if (_soundNumber == 6) {
            isCorrect = false;
          } else if (_soundNumber == 7) {
            isCorrect = false;
          } else if (_soundNumber == 8) {
            isCorrect = true;
          } else if (_soundNumber == 9) {
            isCorrect = false;
          }
          break;
        case 4:
          if (_soundNumber == 0) {
            isCorrect = false;
          } else if (_soundNumber == 1) {
            isCorrect = true;
          } else if (_soundNumber == 2) {
            isCorrect = false;
          } else if (_soundNumber == 3) {
            isCorrect = false;
          } else if (_soundNumber == 4) {
            isCorrect = false;
          } else if (_soundNumber == 5) {
            isCorrect = false;
          } else if (_soundNumber == 6) {
            isCorrect = false;
          } else if (_soundNumber == 7) {
            isCorrect = false;
          } else if (_soundNumber == 8) {
            isCorrect = false;
          } else if (_soundNumber == 9) {
            isCorrect = false;
          }
          break;
      }
    } catch (e) {
      print(e);
    }
    return isCorrect;
  }

  reset() {
    _soundNumber = 0;
  }

  nextQuestion() {
    stopSound();
    _soundNumber++;
  }

  String getQuestionNumber() {
    return _soundData[_soundNumber].number.toString();
  }

  playSound() {
    if (!isPlaying) {
      cachePlayer.play(_soundData[_soundNumber].sound);
      isPlaying = true;
      stopSound();
    }
  }

  stopSound() {
    if (isPlaying) {
      player.onAudioPositionChanged.listen((Duration d) {
        if (d >= (const Duration(seconds: 5))) {
          player.stop();
        }
        isPlaying = false;
      });
    }
  }

  playCardSound(sound) {
    if (!isPlaying) {
      cachePlayer.play('sounds/$sound.mp3');
      isPlaying = true;
      stopSound();
    }
  }

  bool isEnd() {
    bool ended = false;
    if (_soundNumber == _soundData.length) {
      ended = true;
    }
    return ended;
  }

  getSoundQuestion() {
    print('Sound Number: $_soundNumber');
    print('Alternatives: ${_soundData[_soundNumber].choices}');
  }

  showChoice() {
    print(_soundData[_soundNumber].choices[1]);
    //_soundData[_soundNumber].choices[0];
  }

  String getChoice(int index) {
    return _soundData[_soundNumber].choices[index - 1];
  }
}
