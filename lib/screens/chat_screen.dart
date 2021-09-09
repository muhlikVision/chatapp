import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/genericWidgets.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_machine/time_machine.dart';
import '../constants.dart';
import 'package:flutter/services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

//global
User loggedinUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance; //auth data
  final _firestore = FirebaseFirestore.instance; //send and get data
  final msgTextCont = TextEditingController();

  String messageText;
  String messageTime;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    //getMessages();
    getTime();

  }


  String getTime ()
  {
    String now = DateTime.now().toString();
    return now;
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
      print(loggedinUser.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close, color: Colors.red,),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Navigator.pushNamed(context, LoginScreen.id);
              }),
        ],
        title: Text('⚡️Chat', style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgTextCont,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      cursorColor: Colors.lightGreenAccent,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'texts': messageText,
                        'sender': loggedinUser.email,
                        'timeAt': getTime(),
                      });
                      msgTextCont.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
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
}
