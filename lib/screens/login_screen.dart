import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/genericWidgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


//MAIN
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  Future<String> getToken()async{
    return await _LoginScreenState().getToken();
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();


  String email, password;
  bool showSpinner = false;

  final msgTextCont = TextEditingController();

  //functions
  Future<void> storeTokenAndData(UserCredential userCredential)async{

    await storage.write(key: 'token', value: userCredential.credential.token.toString());
    await storage.write(key: 'userCred', value: userCredential.toString());
  }
  Future<String> getToken()async{
    String a = await storage.read(key: 'token');
    print('IN FUNC\n\n');
    print(a);
    return a;
  }

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
              InputField(onChange: (value){
                email = value;
              } ,bcolor: Colors.blueAccent, text: 'Enter Email', type: TextInputType.emailAddress,),
              SizedBox(
                height: 8.0,
              ),
              InputField(onChange: (value){
                password = value;
              } , bcolor: Colors.blueAccent, text: 'Enter Password', chk: true),
              SizedBox(
                height: 24.0,
              ),
              ButtonBuilder(onPress: () async{
                print('$email, $password');
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if(user != null){
                    storeTokenAndData(user);
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }
                catch(e){
                  print(e);
                }
                setState(() {
                  showSpinner = false;
                });
                msgTextCont.clear();
              }, color: Colors.lightBlueAccent, text: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}
