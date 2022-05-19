import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../modules/assistant_learn_data.dart';

AssistentLearnData assistantData = AssistentLearnData();

class LearnAssistantPage extends StatefulWidget {
  const LearnAssistantPage({Key? key}) : super(key: key);

  @override
  State<LearnAssistantPage> createState() => _LearnAssistantPageState();
}

class _LearnAssistantPageState extends State<LearnAssistantPage> {
  bool end = false;
  bool start = true;
  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprendendo Assistentes Virtuais'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                assistantData.getTitle(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                assistantData.getText(),
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pageNumber == 0
                    ? Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.grey.shade600,
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            assistantData.previousPage();
                            pageNumber--;
                          });
                        },
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                        ),
                      ),
                pageNumber == 8
                    ? Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.grey.shade600,
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            assistantData.nextPage();
                            pageNumber++;
                          });
                        },
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
