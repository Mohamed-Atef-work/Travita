import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/show_AI_plan/controller/controller.dart';
import 'package:travita/screens/show_AI_plan/controller/states.dart';

import '../../Component/widgets/defaultText.dart';

class ShowAIPlanScreenTest extends StatelessWidget {
  const ShowAIPlanScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ShowAIPlanController>(
        create: (context) => ShowAIPlanController()..getAIPlan(),
        child: BlocConsumer<ShowAIPlanController, ShowAIPlanStates>(
            builder: (context, state) {
              if (state is GetAIPlanLoading) {
                return Center(
                  child: DefaultText(text: "Loading"),
                );
              } else if (state is GetAIPlanSuccess) {
                return Center(
                  child: DefaultText(text: "Success"),
                );
              } else {
                return Center(
                  child: DefaultText(text: "Error"),
                );
              }
            },
            listener: (context, state) {}),
      ),
    );
  }
}
