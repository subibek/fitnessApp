import 'package:flutter/material.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/helper/utils.dart';
import 'package:project/models/workout.dart';

import 'category.dart';

class SubCategory extends Category{

  List<Workout> workout;

  SubCategory({
    required this.workout,
    required String name,
    required String imgName,
    required Color color,


  }) : super(
      name: name,
      color: color,
      imgName: imgName,
  );
}