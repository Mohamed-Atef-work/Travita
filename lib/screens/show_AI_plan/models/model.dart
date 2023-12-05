import '../../Places_of_type/Models/restaurantsModel.dart';

class ShowAIPlanModel {
  List<Day> days = [];
  ShowAIPlanModel.fromList(List<dynamic> listOfDays) {
    listOfDays.forEach((oneDay) {
      days.add(Day.formList(oneDay));
    });
  }
}

class Day {
  List<DetailsModel> places = [];

  Day.formList(List<dynamic> oneDay) {
    oneDay.forEach((placeMapInsideList) {
      places.add(DetailsModel.fromJsonSurvey(placeMapInsideList[0]));
    });
  }
}
