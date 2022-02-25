import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


double screenHeight(context, {double dividedBy}) {
  return MediaQuery.of(context).size.height / dividedBy;
}

double screenWidth(context, {double dividedBy}) {
  return MediaQuery.of(context).size.width / dividedBy;
}

void push(context, Widget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

void pop(context) {
  Navigator.pop(context);
}


void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}