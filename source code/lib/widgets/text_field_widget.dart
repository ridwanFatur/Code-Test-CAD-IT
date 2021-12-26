import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  TextFieldWidget({
    required this.controller,
    this.hintText = "Hint Text",
    this.textInputType = TextInputType.text,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        focusedBorder: kOutlineInputBorder,
        enabledBorder: kOutlineInputBorderEnabled,
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.only(right: 10, left: 10, top: 4, bottom: 4),
      ),
    );
  }

  OutlineInputBorder kOutlineInputBorderEnabled = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 1, color: Colors.blue),
  );

  OutlineInputBorder kOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 2, color: Colors.blue),
  );
}
