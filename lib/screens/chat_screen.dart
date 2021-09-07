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

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance; //auth data
  final _firestore = FirebaseFirestore.instance; //send and get data
  final msgTextCont = TextEditingController();


  User loggedinUser;
  String messageText;
  String messageTime;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    //getMessages();
    getMessageStream();
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
  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  //   for(var msg in messages.docs){
  //    print(msg.data());
  //   }
  // }

  void getMessageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Navigator.pushNamed(context, LoginScreen.id);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
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
                      style: TextStyle(color: Colors.black, fontSize: 30),
                      cursorColor: Colors.black,
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
