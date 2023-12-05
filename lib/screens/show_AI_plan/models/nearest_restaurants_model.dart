import '../../Places_of_type/Models/restaurantsModel.dart';

class NearestRestaurantsModel {
  List<DetailsModel> restaurants = [];
  NearestRestaurantsModel.fromList(List<dynamic> bigList) {
    bigList[0].forEach((restaurant) {
      restaurants.add(DetailsModel.fromJsonRestaurants(restaurant));
    });
  }
}
