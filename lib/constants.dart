import 'package:flutter/material.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast;

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightGreenAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
  fillColor: Colors.black, focusColor: Colors.black, hoverColor: Colors.black,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.yellowAccent, width: 2.0),
  ),
);


showToast(String text) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text(text),
      ],
    ),
  );


  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2),
  );

  // Custom Toast Position
//   fToast.showToast(
//       child: toast,
//       toastDuration: Duration(seconds: 2),
//       positionedToastBuilder: (context, child) {
//         return Positioned(
//           child: child,
//           top: 16.0,
//           left: 16.0,
//         );
//       });
// }
}