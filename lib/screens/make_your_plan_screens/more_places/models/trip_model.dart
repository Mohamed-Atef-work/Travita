class TripsModel {
  TripsModel({
    required this.trips,
  });
  late final List<Trips> trips;

  TripsModel.fromJson(Map<String, dynamic> json) {
    trips = List.from(json['trips']).map((e) => Trips.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trips'] = trips.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Trips {
  Trips({
    required this.id,
    required this.name,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;

  Trips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
