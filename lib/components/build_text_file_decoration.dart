import 'package:flutter/material.dart';

buildTextFieldDecortaion(String label, String hintText) {
  return InputDecoration(
    labelText: label,
    hintText: hintText,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
  );
}