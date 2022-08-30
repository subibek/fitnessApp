import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color backgroundColor;
  final Color color;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.backgroundColor,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 20, color: color),
    ),
    onPressed: onClicked,
  );
}
