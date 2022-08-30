
import 'package:flutter/material.dart';
import 'package:project/caloriecalculator/counterpage.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/pages/caloriecounterpage.dart';
import 'package:project/pages/categorylistpage.dart';
import 'package:project/pages/homepage.dart';
import 'package:project/pages/progresstrackerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/theme/change_theme_button.dart';

import '../caloriecalculator/resultpage.dart';
import '../models/userInfo.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  String currentUser = LoginPage.currentUser!;
  bool dataExists = false;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          )
      ) ,
    );
  }

  Widget buildHeader (BuildContext context) => Material(
    color: Theme.of(context).primaryColor == Colors.black54
        ? Colors.black54 : Colors.white,
    child: InkWell(
      onTap: (){
      },
      child: Container(
        color: AppColors.main_color,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            SizedBox(height: 24,),
            GestureDetector(
              onTap: () async {
                bool docExists = await checkData();
                if (docExists){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));
                }
                else{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CounterPage()));
                }
              },
              child: CircleAvatar(
                radius: 44,                backgroundImage: AssetImage('assets/imgs/user.png'),
              ),
            ),
            SizedBox(height: 10,),
            Text(currentUser,
              style: TextStyle(fontSize: 24, color: AppColors.text),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    ),
  );

  Widget buildMenuItems (BuildContext context) => Container(
    padding: EdgeInsets.all(4),
    child: Wrap(
      runSpacing: 24,
      children: [
    ListTile(
      leading: const Icon(Icons.dark_mode_outlined),
      title: Text('Dark Mode'),
      trailing: ChangeThemeButton(),
    ),
    ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Log Out'),
          onTap: (){
            LoginPage.currentUser = '';
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ],
    ),
  );

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
