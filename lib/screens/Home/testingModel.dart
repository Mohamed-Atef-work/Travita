class TestingApiModel {
  late final List<Data> data;

  TestingApiModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  late final int id;
  late final String name;
  late final String? image;
  late final String address;
  late final double? latitude;
  late final double? longitude;
  late final String? phone;
  late final String? email;
  late final String? website;
  late final int? rating;
  late final String? rankingInCity;
  late final String? reviewTags;
  late final int hotelClass;
  late final int numberOfReviews;
  late final String? priceRange;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    rating = json['rating'];
    rankingInCity = json['rankingInCity'];
    reviewTags = json['reviewTags'];
    hotelClass = json['hotelClass'];
    numberOfReviews = json['numberOfReviews'];
    priceRange = json['priceRange'];
  }
}
