import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/genericWidgets.dart';


class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 3),
        vsync: this);
    
    animation = ColorTween(begin: Colors.blueAccent, end: Colors.white).animate(controller);
    
    controller.forward();
    
    // animation.addStatusListener((status) {
    //   print(status);
    //   if(status == AnimationStatus.completed)
    //     {
    //       controller.reverse(from: 1);
    //     }
    //   else if (status == AnimationStatus.dismissed)
    //     controller.forward();
    // });

    controller.addListener(() {
      setState(() {
      });
    });
  } //init controller

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  } //disposing controller


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['WhatsApp'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: const Duration(milliseconds: 500),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonBuilder(color: Colors.green, text: 'Login', onPress: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            ButtonBuilder(color: Colors.blueAccent, text: 'Register', onPress: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
          ],
        ),
      ),
    );
  }
}

