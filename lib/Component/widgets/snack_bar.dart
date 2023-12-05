import 'package:flutter/material.dart';

import 'defaultText.dart';

class AppSnackBarWidget extends StatelessWidget {
  final String message;

  const AppSnackBarWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: DefaultText(
        text: message,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(
        seconds: 2,
      ),
    );
  }
}
