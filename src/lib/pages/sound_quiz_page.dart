import 'package:assistant_learn_up/models/sound_question.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import '../modules/sounds_brain.dart';

SoundBrain soundBrain = SoundBrain();

class SoundQuestionPage extends StatefulWidget {
  const SoundQuestionPage({Key? key}) : super(key: key);

  @override
  State<SoundQuestionPage> createState() => _SoundQuestionPageState();
}

class _SoundQuestionPageState extends State<SoundQuestionPage> {
  List<Icon> scoreKeeper = [];
  bool end = false;
  String questionNumber = '1';
  int pageIndex = 1;

  void addScore(bool isCorrect) {
    if (isCorrect) {
      scoreKeeper.add(Icon(FontAwesomeIcons.check));
    } else {
      scoreKeeper.add(Icon(FontAwesomeIcons.close));
    }
  }

  void checkAnswer(int choice) {
    pageIndex++;
    print(soundBrain.getCorrectAnswer(choice));
    if (soundBrain.getCorrectAnswer(choice)) {
      print('acertou');
      soundBrain.getSoundQuestion();
      soundBrain.nextQuestion();
      updateUI();
      addScore(true);
    } else {
      print('errou');
      soundBrain.getSoundQuestion();
      soundBrain.nextQuestion();
      updateUI();
      addScore(false);
    }
  }

  void updateUI() {
    setState(() {
      questionNumber = soundBrain.getQuestionNumber();
    });
  }

  void resetQuiz() {
    soundBrain.reset();
    scoreKeeper = [];
  }

  @override
  void initState() {
    super.initState();
    resetQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Musical'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          end
              ? Text('')
              : Expanded(
                  child: Text(
                    'Pergunta número $questionNumber',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
          end
              ? Text(
                  'Fim do Quiz',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                )
              : Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(110, 70, 110, 70),
                    child: GestureDetector(
                      onTap: () {
                        soundBrain.playSound();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade600,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.volumeHigh,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                ),
          end
              ? Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 180, 10, 180),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Voltar para home',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    ),
                  ),
                )
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        print('questio1');
                        setState(() {
                          if (pageIndex == 10) {
                            end = true;
                          } else {
                            checkAnswer(1);
                          }
                        });
                      },
                      child: Text(
                        soundBrain.getChoice(1),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue.shade300),
                    ),
                  ),
                ),
          end
              ? Text('')
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        print('question2');
                        setState(() {
                          if (pageIndex == 10) {
                            end = true;
                          } else {
                            checkAnswer(2);
                          }
                        });
                      },
                      child: Text(
                        soundBrain.getChoice(2),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ),
                ),
          end
              ? Text('')
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        print('questio3');
                        setState(() {
                          if (pageIndex == 10) {
                            end = true;
                          } else {
                            checkAnswer(3);
                          }
                        });
                      },
                      child: Text(
                        soundBrain.getChoice(3),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue.shade500),
                    ),
                  ),
                ),
          end
              ? Text('')
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        print('question2');
                        setState(() {
                          if (pageIndex == 10) {
                            end = true;
                          } else {
                            checkAnswer(4);
                          }
                        });
                      },
                      child: Text(
                        soundBrain.getChoice(4),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightGreen),
                    ),
                  ),
                ),
          Row(
            children: scoreKeeper,
          )
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
