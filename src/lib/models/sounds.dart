import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';

class SoundQuestion {
  Future<AudioPlayer> sound;
  List<String> choices;

  SoundQuestion(this.sound, this.choices);
}
