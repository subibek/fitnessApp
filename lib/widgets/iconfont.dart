import 'package:flutter/material.dart';
import 'dart:ui';

class IconFont extends StatelessWidget{

  Color color;
  double size;
  String iconName;

  IconFont ({ required this.color, required this.size, required this.iconName});

  Widget build(BuildContext context){
    return Text(this.iconName,
      style: TextStyle(
          color: this.color,
          fontSize: this.size,
          fontFamily: 'logo'
      ),
    );
  }
}