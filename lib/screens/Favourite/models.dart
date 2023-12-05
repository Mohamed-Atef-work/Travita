import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';

class FavoritesModel {
  late final Data data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late List<DetailsModel> allFavorites = [];

  Data.fromJson(Map<String, dynamic> json) {
////////////////////////////////////////////////////////////////////////////////
    print("------------------------------------------------> I'm deleting");

    allFavorites.clear();

    print("------------------------------------------------> Deleted");
////////////////////////////////////////////////////////////////////////////////

    allFavorites = List.from(json['Restaurant'])
            .map((e) => DetailsModel.fromJsonRestaurants(e))
            .toList() +
        List.from(json['Hotel'])
            .map((e) => DetailsModel.fromJsonHotels(e))
            .toList() +
        List.from(json['Attraction'])
            .map((e) => DetailsModel.fromJsonAttraction(e))
            .toList();
    print("------------------------------------------------> Concatenated");
  }
}
