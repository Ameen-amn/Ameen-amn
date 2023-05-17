import 'package:flutter/material.dart';

const klabelStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
);

InputDecoration kFieldStyle = const InputDecoration(
  labelStyle: klabelStyle,
  border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.black54,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10))),
  contentPadding: EdgeInsets.fromLTRB(20, 4, 20, 4),
  /* enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(

      color: textFieldBG,
      width: 2,
    ),
  ), */
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
    borderSide: BorderSide(
      width: 2,
      color: Colors.black54,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
);
