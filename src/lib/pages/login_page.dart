import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import '../components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;
  User? user;
  final auth = FirebaseAuth.instance;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    auth.signOut();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 130,
              child: Image.asset('assets/images/playstore.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            kTitle,
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Digite seu Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Digite sua Senha'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              buttonColor: Colors.lightBlue,
              buttonLabel: 'Entrar',
              onPress: () async {
                setState(() {
                  _loading = true;
                });
                try {
                  final user = await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, '/home');
                    setState(() {
                      _loading = false;
                    });
                  }
                } catch (e) {
                  setState(() {
                    _loading = false;
                  });
                  _showAlert(context, 'Erro', 'Erro ao fazer login');
                  //print(e);
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Ainda não possui cadstro?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                MyButton(
                  buttonColor: Colors.lightGreen,
                  buttonLabel: 'Cadastre-se',
                  onPress: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                ),
                const Text(
                  'Ou entre com o Google',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      _loading = true;
                    });
                    try {
                      UserCredential userCred = await signInWithGoogle();
                      user = userCred.user;
                      if (user != null) {
                        Navigator.pushNamed(context, '/home');
                        setState(() {
                          _loading = false;
                        });
                      }
                    } catch (e) {
                      setState(() {
                        _loading = false;
                      });
                      _showAlert(context, 'Erro', 'Erro ao fazer login');
                      //print(e);
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.google),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  _showAlert(context, title, label) {
    Alert(
        type: AlertType.error,
        style: kAlertStyle,
        context: context,
        title: title,
        desc: label,
        buttons: [
          DialogButton(
            child: const Text(
              "Cancelar",
              style: kDialogTextStyle,
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ]).show();
  }
}
