import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final double buttonFontSize;
  final buttonTapped;

  const Buttons({
    Key key,
    this.color,
    this.textColor,
    this.buttonText,
    this.buttonFontSize,
    this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: buttonFontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
