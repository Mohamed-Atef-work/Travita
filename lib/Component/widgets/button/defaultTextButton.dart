import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  String text;
  double? fontSize;
  Color? textColor;
  late Function onPressed;

  DefaultTextButton({
    required this.text,
    this.textColor,
    required this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
