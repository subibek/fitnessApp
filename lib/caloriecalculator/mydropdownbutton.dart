import 'package:flutter/material.dart';
import 'package:project/caloriecalculator/enums.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/widgets/mainappbar.dart';

class myDropdownButtonAL extends StatelessWidget {

  final ActivityLevel? value;
  final Function(ActivityLevel)? onChanged;

  const myDropdownButtonAL({Key? key, this.value, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:MainAppBar(),
        body: Padding(
          padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Activity Level'),
                DropdownButton(
                    items: ActivityLevel.values.map((ActivityLevel value){
                      return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value.toString().split('.').last,
                          ));
                    }).toList(),
                    onChanged: (value){

                    },
                )
              ],
            ),
          
        )
    );
  }
}

class myDropDownButtonGoal extends StatelessWidget {

  final Goal? value;
  final Function(Goal)? onChanged;

  const myDropDownButtonGoal({Key? key, this.value, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:MainAppBar(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Goal'),
              DropdownButton(
                  items: Goal.values.map((Goal value){
                    return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.toString().split('.').last,
                        ));
                  }).toList(),
                  onChanged: (val){

                  })

            ],
          ),

        )
    );
  }
}


