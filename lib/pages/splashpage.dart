import 'package:flutter/material.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/pages/welcomepage.dart';
import 'package:project/widgets/iconfont.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomePage(),
          )
      );
    });

    return Scaffold(
        body: Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: IconFont(
              color: AppColors.text,
              iconName: 'a',
              size: 100,
            )
        )
    );
  }
}