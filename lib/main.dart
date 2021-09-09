

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FlashChat());
}


class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() =>_FlashChatState();
}

class _FlashChatState extends State<FlashChat>{

  String currentPage = WelcomeScreen.id;
  LoginScreen log = LoginScreen();

  @override
  void initState() {

    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async{
    String token = await log.getToken();
    print('MAIN DART TOKEN: $token');
    if(token != null){
      print('IN CONDITION');
      setState(() {
        currentPage = ChatScreen.id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),

      initialRoute: currentPage,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },

    );
  }

}