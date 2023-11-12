import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final Function() buttonTapped;

  MyButton(this.color, this.textColor, this.buttonText, this.buttonTapped);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          color: color,
          clipBehavior: Clip.hardEdge,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFA5968C))),
          child: InkWell(
              onTap: buttonTapped,
              splashColor: Color(0xFFEAAFB7),
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(
                  color: Color(0xFFfdfff2),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )))),
    );
  }
}
