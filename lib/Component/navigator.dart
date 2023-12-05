import 'package:flutter/material.dart';

void defaultNavigator(context, Widget nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
}
