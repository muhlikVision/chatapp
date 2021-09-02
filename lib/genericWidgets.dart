import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ButtonBuilder extends StatelessWidget {

  ButtonBuilder({this.color,@required this.onPress, this.text});
  final Color color;
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {

  InputField({this.onChange, this.text, this.bcolor, this.chk, this.type});
  final Function onChange;
  final String text;
  final Color bcolor;
  final bool chk;
  final TextInputType type;


  bool checkNull(bool chk){
    if(chk == null)
     return false;
    else
      return true;
  }
  TextInputType checkText(TextInputType text)
  {
    if(text == null)
      return TextInputType.text;
    else
      return type;
  }


  @override
  Widget build(BuildContext context) {
    //
    return TextField(
      keyboardType: checkText(type),
      obscureText: checkNull(chk),
      textAlign: TextAlign.center, style: TextStyle(color: Colors.yellowAccent),
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: text,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: bcolor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: bcolor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}