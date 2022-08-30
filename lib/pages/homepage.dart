import 'package:flutter/material.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:project/widgets/navigationdrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
