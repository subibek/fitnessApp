import 'package:flutter/material.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:project/widgets/navigationdrawer.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text('User Info Page'),
      ),
    );
  }
}
