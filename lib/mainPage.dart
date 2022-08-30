import 'package:flutter/material.dart';
import 'package:project/pages/caloriecounterpage.dart';
import 'package:project/pages/categorylistpage.dart';
import 'package:project/pages/progresstrackerpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int index = 0;

  final screens = [
    CategoryListPage(),
    CalorieCounter(),
    ProgressTracker()
  ];

  @override
  Widget build(BuildContext context) {

    Color indicatorColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.black87 : Colors.black12;

    Color navBarBGColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.black : Colors.white;


    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: indicatorColor,
        ),
        child: NavigationBar(
          backgroundColor: navBarBGColor,
          height: 60,
          selectedIndex: index,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 2),
          onDestinationSelected: (index) =>
          setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                selectedIcon: Icon(Icons.favorite),
                icon: Icon(Icons.favorite_border_outlined),
                label: 'Workout'
            ),
            NavigationDestination(
                selectedIcon: Icon(Icons.add),
                icon: Icon(Icons.add_outlined),
                label: 'Calorie Counter'
            ),
            NavigationDestination(
                selectedIcon: Icon(Icons.add_chart),
                icon: Icon(Icons.add_chart_outlined),
                label: 'Progress Tracker'
            ),
          ],
        ),
      ),

    );
  }
}
