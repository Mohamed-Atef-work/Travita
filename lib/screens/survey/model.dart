class SurveyModel {
  List<Item> items = [];
  SurveyModel.formJson(Map<String, dynamic> json) {
    json["survey"].forEach((element) {
      items.add(Item.fromJson(element[0]));
    });
  }
}

class Item {
  late final int id;
  late final String name;
  late final String image;

  Item.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
}
