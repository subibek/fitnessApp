import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/caloriecalculator/counterpage.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/pages/caloriecounterpage.dart';
import 'package:project/pages/userpage.dart';

import '../caloriecalculator/resultpage.dart';
import '../login/loginPage.dart';
import 'iconfont.dart';
import 'custom_page_route.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget{
  const MainAppBar({Key? key}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MainAppBarState extends State<MainAppBar> {

  String currentUser = LoginPage.currentUser!;

  @override
  Widget build(BuildContext context) {

    Color iconColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.white : Colors.black;

    return AppBar(
        iconTheme: IconThemeData(
          color: iconColor,
        ),
      centerTitle: true,
      title:  Padding(
        padding: EdgeInsets.only(top: 15),
        child: IconFont(
        iconName: 'a',
        color: iconColor,
        size: 40,
      ),
      ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          GestureDetector(
            onTap: () async {
              bool docExists = await checkData();
              if (docExists){
                Navigator.of(context).push(
                    CustomPageRoute(routePage: ResultPage()));
              }
              else{
                Navigator.of(context).push(
                    CustomPageRoute(routePage: CounterPage()));
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(10),
              child: ClipOval(
                child: Image.asset('assets/imgs/user.png'),
              ),
            ),
          )
        ]
    );
  }


  Future<bool> checkData() async {
    var variable = await FirebaseFirestore.instance.collection('userInfo')
        .doc(currentUser).get();
    Map<String, dynamic>? data = variable.data();
    if (data != null){
      return true;
    }
    else
      return false;

  }
}
