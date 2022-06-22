import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      required this.buttonColor,
      required this.buttonLabel,
      required this.onPress})
      : super(key: key);

  String buttonLabel;
  VoidCallback onPress;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: buttonColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonLabel,
            style: const TextStyle(color: Colors.black87, fontSize: 18),
          ),
        ),
        onPressed: onPress,
      ),
    ));
  }
}
