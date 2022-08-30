import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CustomPageRoute extends CupertinoPageRoute {

  Widget routePage;

  CustomPageRoute({
    required this.routePage
})
  : super(builder: (BuildContext context) => routePage);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
     Animation<double> secondaryAnimation ){
    return new SizeTransition(
            sizeFactor: animation,
            child: this.routePage,
            axisAlignment: 4,
    );
  }
}