import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/AI_plan_survey/controller/states.dart';
import 'package:travita/core/app_constants/constants.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';

class AIPlanSurveyController extends Cubit<AIPlanSurveyStates> {
  AIPlanSurveyController() : super(AIPlanInitial());
  static AIPlanSurveyController get(context) => BlocProvider.of(context);

  List<Color> textFormFieldBorderColors = [
    AppColors.blue,
    AppColors.blue,
    AppColors.blue,
  ];

  late final List<String> listOfInformation = [
    'Days',
    'Budget',
    'City',
  ];
  late final List listOfIconInformation = [
    Icons.calendar_month_outlined,
    Icons.monetization_on_rounded,
    Icons.location_city,
  ];
  late final TextEditingController daysController = TextEditingController();
  late final TextEditingController budgetController = TextEditingController();
  late final TextEditingController cityController = TextEditingController();
  late final List<TextEditingController> textControllers = [
    daysController,
    budgetController,
    cityController,
  ];
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double? longitude;
  double? latitude;

  void createAiPlan({
    required BuildContext context,
    double? longitude,
    double? latitude,
  }) {
    if (daysController.text.isNotEmpty &&
        budgetController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        longitude != null &&
        latitude != null) {
      emit(CreateAIPlanLoading());
      DioHelper.postData(
        url: "plan",
        baseUrl: AppConstants.baseUrl,
        data: {
          "city": cityController.text,
          "days": daysController.text,
          "price": budgetController.text,
          "longitude": longitude,
          "latitude": latitude,
        },
      ).then((value) {
        emit(CreateAIPlanSuccess());
      }).catchError((error) {
        print("create error is -------------> $error");
        emit(CreateAIPlanError());
      });
    } else {
      emit(NoTValidFormField());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: DefaultText(
            text: "Where is the data ?",
            textAlign: TextAlign.center,
          ),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }

  void determineStartPosition() {
    emit(DetermineStatePosition());
  }

  void doneDeterminingStartPosition() {
    emit(AIPlanInitial());
  }
}
