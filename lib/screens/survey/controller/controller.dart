import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/survey/controller/states.dart';
import 'package:travita/screens/survey/model.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';

import '../../../Component/navigate_and_finish.dart';
import '../../layOut/view.dart';

class SurveyController extends Cubit<SurveyStates> {
  SurveyController() : super(SurveyInitialState());

  static SurveyController get(context) => BlocProvider.of(context);

  SurveyModel? surveyModel;
  PlacesModel? placesModel;

  List<bool> isRated = [false, false, false, false, false, false];

  void getSurvey() {
    emit(GetSurveyLoading());
    DioHelper.getSurveyData().then((value) {
      //surveyModel = SurveyModel.formJson(value.data);
      placesModel = PlacesModel.fromJsonSurvey(value.data);
      emit(GetSurveySuccess());
    }).catchError((error) {
      print("The error is -------------------> ${error}");
      emit(GetSurveyError());
    });
  }

  void sendRate({
    required String imageId,
    required String rate,
    required int index,
  }) {
    emit(SendSurveyRateLoading());
    DioHelper.sendSurveyRate(imageId: imageId, rate: rate).then((value) {
      isRated[index] = true;
      emit(SendSurveyRateSuccess());
    }).catchError((error) {
      isRated[index] = false;
      emit(SendSurveyRateError());

      print("The error is -------------------> ${error}");
    });
  }

  void navigateToLayOut({required BuildContext context}) {
    for (bool isItemRanted in isRated) {
      if (isItemRanted == false) {
        return;
      }
    }
    navigateAndFinish(
      context: context,
      newScreen: LayOutScreen(),
    );
  }
}
