import 'package:flutter/material.dart';

import 'widgets/onBoardingThree.dart';

class OnBoardingController {
  int currentIndex = 0;

  /*List<Widget> onBoardingScreens = [
    //OnBoardingOne(),
    //OnBoardingTwo(),
    OnBoardingThree(),
  ];*/

  List<String> images = [
    "image/onBoardingTwo.png",
    "image/onBoardingOne.png",
  ];

  List<String> texts = [
    "Welcome to travita, we help you to learn about the tourist places in the country you are visiting.",
    "Based on your interests, we help you build a complete travel plan that fits your financial budget",
  ];
}
