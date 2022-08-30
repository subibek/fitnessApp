
import 'dart:ui';

import 'package:project/helper/appcolors.dart';
import 'package:project/helper/utils.dart';
import 'package:project/models/subcategory.dart';

class Category{
  String name;
  Color color;
  String imgName;
  List<Category>? subCategories;

  Category(
      {
        this.name = '',
        this.color = AppColors.main_color,
        this.imgName = '',
        this.subCategories,
      }
      );
}