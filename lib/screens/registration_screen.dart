import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/genericWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'reg_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        color: Colors.yellow,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              InputField(
                onChange: (value) {
                  email = value;
                },
                bcolor: Colors.blueAccent,
                text: 'Enter Email',
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8.0,
              ),
              InputField(
                  onChange: (value) {
                    password = value;
                  },
                  bcolor: Colors.blueAccent,
                  text: 'Enter Password',
                  chk: true),
              SizedBox(
                height: 24.0,
              ),
              ButtonBuilder(
                  onPress: () async {
                    print(email);
                    print(password);
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(newUser != null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                  color: Colors.blueAccent,
                  text: 'Register'),
            ],
          ),
        ),
      ),
    );
  }
}
