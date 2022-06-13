import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';

class SoundQuestion {
  String sound;
  List<String> choices;
  int number;

  SoundQuestion(this.sound, this.choices, this.number);
}
