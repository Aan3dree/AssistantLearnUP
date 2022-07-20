import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kTitleTextStyle = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

const kTitle = Text(
  'Assistant Learn\'Up',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
);

const kHomeTitle = Text(
  'Assistant Learn\'Up',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
);

const kUserNameStyle = TextStyle(fontSize: 22);

const kLearnPageTitleStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

const kHomeMessage = Expanded(
  child: Text(
    "O que você gostaria de fazer?",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 18),
  ),
);

const kInputTextColor = TextStyle(color: Colors.white);

const kAlertStyle = AlertStyle(backgroundColor: Colors.white);

const kDialogTextStyle = TextStyle(color: Colors.black, fontSize: 20);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kInputDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.blueGrey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
