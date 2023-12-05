import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/Search/controller/controller.dart';
import 'package:travita/screens/Search/controller/states.dart';

import '../../Component/widgets/defaultText.dart';

class SearchTestScreen extends StatelessWidget {
  const SearchTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SearchImageController>(
        create: (context) => SearchImageController()..getSearchResult(),
        child: BlocConsumer<SearchImageController, SearchStates>(
            builder: (context, state) {
              if (state is GetSearchResultLoading) {
                return Center(
                  child: DefaultText(text: "Loading"),
                );
              } else if (state is GetSearchResultSuccess) {
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
