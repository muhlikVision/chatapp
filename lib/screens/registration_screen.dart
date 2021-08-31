import 'package:flutter/material.dart';
import 'package:flash_chat/genericWidgets.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'reg_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            InputField( bcolor: Colors.blueAccent, text: 'Enter Email',),
            SizedBox(
              height: 8.0,
            ),
            InputField( bcolor: Colors.blueAccent, text: 'Enter Password',),
            SizedBox(
              height: 24.0,
            ),
            ButtonBuilder(onPress: (){}, color: Colors.blueAccent, text: 'Register'),
          ],
        ),
      ),
    );
  }
}


