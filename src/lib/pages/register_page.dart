import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late String displayName;
  late String email;
  late String password;
  final auth = FirebaseAuth.instance;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 130,
              child: Image.asset('assets/images/playstore.png'),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                displayName = value;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Digite seu Nome'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Digite seu Email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Digite sua Senha'),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });
                  try {
                    var user;
                    await auth
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((user) =>
                            auth.currentUser?.updateDisplayName(displayName));
                    Navigator.popAndPushNamed(context, '/login');
                    setState(() {
                      _saving = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.popAndPushNamed(context, '/login'),
          width: 120,
        )
      ],
    ).show();
  }
}
