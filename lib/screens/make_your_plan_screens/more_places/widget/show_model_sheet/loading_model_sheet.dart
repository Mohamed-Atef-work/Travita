import 'package:flutter/material.dart';

class LoadingModelSheetWidget extends StatelessWidget {
  const LoadingModelSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
