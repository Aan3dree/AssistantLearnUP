import 'package:flutter/material.dart';
import '../modules/sounds_brain.dart';

SoundBrain soundBrain = SoundBrain();

class InstrumentPage extends StatefulWidget {
  const InstrumentPage({Key? key}) : super(key: key);

  @override
  State<InstrumentPage> createState() => _InstrumentPageState();
}

class _InstrumentPageState extends State<InstrumentPage> {
  @override
  void dispose() {
    super.dispose();
    soundBrain.stopSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instrumentos'),
        backgroundColor: Colors.teal,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('violino');
                  },
                  child: Image.network("https://i.imgur.com/sHRbhc7.png"),
                ),
                const Text(
                  "Violino",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('acordeon');
                  },
                  child: Image.network("https://i.imgur.com/B3tfKcI.png"),
                ),
                const Text(
                  "Acordeon",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('alfaia');
                  },
                  child: Image.network("https://i.imgur.com/9XoMB2E.png"),
                ),
                const Text(
                  "Alfaia",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('atabaque');
                  },
                  child: Image.network("https://i.imgur.com/tx3VUSP.png"),
                ),
                const Text(
                  "Atabaque",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('berimbau');
                  },
                  child: Image.network("https://i.imgur.com/CeztqJd.png"),
                ),
                const Text(
                  "Berimbau",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('harpa');
                  },
                  child: Image.network("https://i.imgur.com/zIC4XCO.png"),
                ),
                const Text(
                  "Harpa",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('pandeiro');
                  },
                  child: Image.network("https://i.imgur.com/h1OkTgJ.png"),
                ),
                const Text(
                  "Pandeiro",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('teclado');
                  },
                  child: Image.network("https://i.imgur.com/OqDOjTJ.png"),
                ),
                const Text(
                  "Teclado",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('violao');
                  },
                  child: Image.network("https://i.imgur.com/eAJxmSe.png"),
                ),
                const Text(
                  "Violão",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    soundBrain.playCardSound('zabumba');
                  },
                  child: Image.network("https://i.imgur.com/LLlRo7Y.png"),
                ),
                const Text(
                  "Zabumba",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
