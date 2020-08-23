import 'package:flutter/material.dart';

Widget button(String text, Function pressedCallback) {
  return MaterialButton(
    key: null,
    onPressed: () {
      pressedCallback();
    },
    color: Colors.yellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    elevation: 5.0,
    minWidth: 200.0,
    height: 60.0,
    child: Text(
      text,
      style: TextStyle(
          fontSize: 22.0,
          color: Colors.black54,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto"),
    ),
  );
}
