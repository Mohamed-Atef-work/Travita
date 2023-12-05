import 'package:flutter/material.dart';

void navigateAndFinish({required context, required Widget newScreen}) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => newScreen,
    ),
        (Route<dynamic> route) => false);
