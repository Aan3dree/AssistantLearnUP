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
  List<Icon> scoreKeeper = [];
  int pageIndex = 0;
  bool end = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz das Assistentes Virtuais'),
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
                  style: const TextStyle(fontSize: 28),
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
                  //print('Choose 1');
                  if (end) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      if (pageIndex >= 7) {
                        quizBrain.endGame();
                        end = true;
                      } else {
                        if (quizBrain.isCorrectAnswer(1)) {
                          scoreKeeper.add(const Icon(FontAwesomeIcons.check));
                        } else {
                          scoreKeeper.add(const Icon(FontAwesomeIcons.xmark));
                        }
                        quizBrain.nextQuestion();
                        //print(pageIndex);
                        pageIndex++;
                        //print(pageIndex);
                      }
                    });
                  }
                },
                child: Text(
                  quizBrain.getChoice(1),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
              ),
            ),
          ),
          end
              ? const Text('')
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        //print('Choose 2');
                        setState(() {
                          if (pageIndex >= 7) {
                            quizBrain.endGame();
                            end = true;
                          } else {
                            if (quizBrain.isCorrectAnswer(2)) {
                              scoreKeeper
                                  .add(const Icon(FontAwesomeIcons.check));
                            } else {
                              scoreKeeper
                                  .add(const Icon(FontAwesomeIcons.close));
                            }
                            //print(pageIndex);
                            quizBrain.nextQuestion();
                            pageIndex++;
                            //print(pageIndex);
                          }
                        });
                      },
                      child: Text(
                        quizBrain.getChoice(2),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightGreen),
                    ),
                  ),
                ),
          end
              ? const Text('')
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        //print('Choose 3');
                        setState(() {
                          if (pageIndex >= 7) {
                            quizBrain.endGame();
                            end = true;
                          } else {
                            if (quizBrain.isCorrectAnswer(3)) {
                              scoreKeeper
                                  .add(const Icon(FontAwesomeIcons.check));
                            } else {
                              scoreKeeper
                                  .add(const Icon(FontAwesomeIcons.close));
                            }
                            quizBrain.nextQuestion();
                            //print(pageIndex);
                            pageIndex++;
                            //print(pageIndex);
                          }
                        });
                      },
                      child: Text(
                        quizBrain.getChoice(3),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
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
