import 'package:firebase_auth/firebase_auth.dart';

class UserInform {

  final String username;
  final double height;
  final double weight;
  final int age;
  final String activityLevel;
  final String goal;
  final String gender;
  final double totalCalories;
  final double bmi;
  final double tdee;
  final String bmiScale;

  UserInform({
    required this.username,
    required this.height,
    required this.weight,
    required this.age,
    required this.activityLevel,
    required this.goal,
    required this.gender,
    required this.totalCalories,
    required this.bmi,
    required this.tdee,
    required this.bmiScale
  });

  Map<String, dynamic> toJson() => {
    'username' : username,
    'height': height,
    'weight': weight,
    'age' : age,
    'activityLevel' : activityLevel,
    'goal' : goal,
    'gender' : gender,
    'totalCalories' : totalCalories,
    'bmi' : bmi,
    'tdee' : tdee,
    'bmiScale' : bmiScale
  };

  static UserInform fromJson(Map<String, dynamic> json) => UserInform(
      username: json['username'],
      height : json['height'],
      weight : json['weight'],
      age : json['age'],
      activityLevel : json['activitLevel'],
      goal : json['goal'],
      gender : json['gender'],
      totalCalories : json['totalCalories'],
      bmi : json['bmi'],
      tdee : json['tdee'],
      bmiScale : json['bmiScale']
  );

}