import 'package:assistant_learn_up/components/my_button.dart';
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
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 130,
              child: Image.asset('assets/images/playstore.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Assistant Learn\'Up',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 32, 8, 4),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  displayName = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Digite seu Nome'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Digite seu Email'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Digite sua Senha'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              buttonColor: Colors.lightBlue,
              buttonLabel: 'Cadastrar',
              onPress: () async {
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
                  setState(() {
                    _saving = false;
                  });
                  Alert(
                      type: AlertType.error,
                      style: AlertStyle(backgroundColor: Colors.white),
                      context: context,
                      title: "Erro",
                      desc: "Erro ao fazer login",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ]).show();
                  print(e);
                }
              },
            )
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
