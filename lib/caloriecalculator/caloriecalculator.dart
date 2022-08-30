import 'dart:math';

import 'package:flutter/material.dart';

import 'enums.dart';

class calorieCalculator{
  final double? weight;
  final double? height;
  final int? age;
  final ActivityLevel? activityLevel;
  final Goal? goal;
  final Gender? gender;

  calorieCalculator({
    this.weight,
    this.height,
    this.age,
    this.activityLevel,
    this.goal,
    this.gender
  });

  double bmi(){
    return (weight! / pow(height!/100, 2));
  }

  String bmiScale(){
    if(bmi() < 18.5)
      return 'UNDERWEIGHT';
    else if (bmi() >= 18.5 && bmi() <= 24.9)
      return 'NORMAL';
    else if (bmi() >= 25 && bmi() <= 29.9)
      return 'OVERWEIGHT';
    else if (bmi() >= 30 && bmi() <= 34.9)
      return 'OBESE';
    else if (bmi() >= 35 )
      return 'EXTEREMELY OBESE';
    else
      return 'BMI';
  }

  double bmr(){
    if (gender == Gender.male){
      return 10*weight! + 6.25*height! - 5*weight! - 5*age! + 5;
    }
    else {
      return 10*weight! + 6.25*height! - 5*weight! - 5*age! - 161;
    }
  }

  double tdee() {
    if (activityLevel == ActivityLevel.Inactive)
      return bmr() * 1.2;
    else if (activityLevel == ActivityLevel.Light)
      return bmr() * 1.375;
    else if (activityLevel == ActivityLevel.Moderate)
      return bmr() * 1.55;
    else if (activityLevel == ActivityLevel.Very)
      return bmr() * 1.725;
    else if (activityLevel == ActivityLevel.Extremely)
      return bmr() * 1.9;
    else
      return 0;
  }

  double totalCalories() {
    if (goal == Goal.Loose) {
      return (tdee() - 600);
    } else if (goal == Goal.Maintain) {
      return tdee();
    } else if (goal == Goal.Gain) {
      return tdee() + 800;
    } else
      return 0;
  }
}