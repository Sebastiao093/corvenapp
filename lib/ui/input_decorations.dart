import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrangeAccent)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.deepOrangeAccent,
          width: 2,
        )),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? 
        Icon( prefixIcon, color: Colors.deepOrangeAccent, ) 
        : null);
  }

  static InputDecoration authDiferentInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
      
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? 
        Icon( prefixIcon, color: Colors.white, ) 
        : null);
  }

}
