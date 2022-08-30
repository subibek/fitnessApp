
import 'dart:convert';


SearchResults searchResultsFromJson(String str) => SearchResults.fromJson(json.decode(str));

String searchResultsToJson(SearchResults data) => json.encode(data.toJson());

class SearchResults {
  SearchResults({
    required this.fdcId,
    required this.description,
    required this.dataType,
    required this.publicationDate,
    required this.foodCode,
    required this.foodNutrients,
  });

  int fdcId;
  String description;
  String dataType;
  String publicationDate;
  String foodCode;
  List<FoodNutrient> foodNutrients;

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
    fdcId: json["fdcId"],
    description: json["description"],
    dataType: json["dataType"],
    publicationDate:json["publicationDate"].toString(),
    foodCode: json["foodCode"],
    foodNutrients: List<FoodNutrient>.from(json["foodNutrients"].map((x) => FoodNutrient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fdcId": fdcId,
    "description": description,
    "dataType": dataType,
    "publicationDate": publicationDate,
    "foodCode": foodCode,
    "foodNutrients": List<dynamic>.from(foodNutrients.map((x) => x.toJson())),
  };
}

class FoodNutrient {
  FoodNutrient({
    required this.number,
    required this.name,
    required this.amount,
    required this.unitName,
  });

  String number;
  String name;
  String amount;
  String unitName;

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
    number: json["number"],
    name: json["name"],
    amount: json["amount"].toString(),
    unitName:json["unitName"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "amount": amount,
    "unitName": unitName,
  };
}
