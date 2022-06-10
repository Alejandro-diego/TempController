import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tempcontrol/widget/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DatabaseReference database = FirebaseDatabase.instance.ref();
  late FirebaseMessaging messaging;
  final _formKey = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final senha = TextEditingController();

  @override
  void dispose() {
    usuario.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              width: _size.width * 0.88,
              height: _size.height,
              left: _size.width * 0.10,
              top: _size.height * 0.15,
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Positioned(
              width: _size.width * 0.88,
              height: _size.height,
              left: _size.width * 0.05,
              top: _size.height * 0.05,
              child: FormSigIn(
                keyvalidator: _formKey,
                passcontroller: senha,
                usercontroller: usuario,
              ),
            ),
            Positioned(
              left: _size.width * 0.2,
              top: _size.height * 0.6,
              child: SizedBox(
                height: 80,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            'Firebase Go',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                      sigIN();
                      getToken();
                    }
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    primary: const Color.fromARGB(255, 19, 18, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: _size.width * 0.55,
              top: _size.height * 0.92,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Power By',
                    style: GoogleFonts.cedarvilleCursive(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    'IOT',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      textStyle:
                          const TextStyle(color: Colors.red, fontSize: 40),
                    ),
                  ),
                  Text(
                    'ech',
                    style: GoogleFonts.roboto(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future sigIN() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usuario.text.trim(),
        password: senha.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  void getToken() async {
    FirebaseMessaging.instance.getInitialMessage();

    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      
      database.ref.child('data').update({
        'token': value,
      });
    });
  }
}
