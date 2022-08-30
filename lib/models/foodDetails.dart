import 'package:cloud_firestore/cloud_firestore.dart';

class FoodDetails {
  String username;
  String description;
  double calories;
  String date;
  double per100;

  FoodDetails({
    required this.username,
    required this.description,
    required this.calories,
    required this.date,
    required this.per100,
  });

  Map<String, dynamic> toJson() => {
    'username' : username,
    'description' : description,
    'calories': calories,
    'date': date,
    'per100': per100
  };

  static FoodDetails fromJson(Map<String, dynamic> json) => FoodDetails(
      username: json['username'],
      description: json['description'],
      calories: json['calories'],
      date: json['date'],
      per100: json['per100']
  );
}