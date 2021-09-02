import 'package:flutter/material.dart';
import 'package:flash_chat/genericWidgets.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
            InputField(onChange: (value){
              //email = value;
            } ,bcolor: Colors.blueAccent, text: 'Enter Email', type: TextInputType.emailAddress,),
            SizedBox(
              height: 8.0,
            ),
            InputField(onChange: (value){
              //password = value;
            } , bcolor: Colors.blueAccent, text: 'Enter Password', chk: true),
            SizedBox(
              height: 24.0,
            ),
            ButtonBuilder(onPress: (){}, color: Colors.lightBlueAccent, text: 'Login'),

          ],
        ),
      ),
    );
  }
}
