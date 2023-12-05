import 'package:flutter/material.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/textFrmField/simple%20textFiels.dart';

import '../controller/controller.dart';

class AIPlanSurveyFormWidget extends StatelessWidget {
  const AIPlanSurveyFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AIPlanSurveyController.get(context).formKey,
      child: Column(
        children: List.generate(
          3,
          (index) => SimpleTextFormFiled(
            borderColor: AIPlanSurveyController.get(context)
                .textFormFieldBorderColors[index],
            controller:
                AIPlanSurveyController.get(context).textControllers[index],
            validate: (value) {
              if (value!.isEmpty) {
                AIPlanSurveyController.get(context)
                    .textFormFieldBorderColors[index] = Colors.red;
              } else {
                AIPlanSurveyController.get(context)
                    .textFormFieldBorderColors[index] = AppColors.blue;
              }
              return null;
            },
            icon: AIPlanSurveyController.get(context)
                .listOfIconInformation[index],
            type: AIPlanSurveyController.get(context).listOfInformation[index],
          ),
        ),
      ),
    );
  }
}
