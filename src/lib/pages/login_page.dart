import 'package:flutter/material.dart';
import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              //email = value;
            },
            decoration: kInputDecoration.copyWith(hintText: 'Digite seu Email'),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              //password = value;
            },
            decoration: kInputDecoration.copyWith(hintText: 'Digite sua Senha'),
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
                  'Entrar',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ainda não possui cadstro?',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Registrar',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              },
            ),
          ),
        ],
      ),
    );
  }
}
