import 'package:flutter/material.dart';
final message=GlobalKey<ScaffoldMessengerState>();
class Utils {
  static showSnackBar(String?text){
    if(text==null)return;
    final snackBar=SnackBar(content: Text(text),backgroundColor: Colors.red,);
      message.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}