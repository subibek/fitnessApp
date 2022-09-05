import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/models/subcategory.dart';
import 'package:project/timer/workoutTimer.dart';
import 'package:project/widgets/mainappbar.dart';

import '../helper/appcolors.dart';
import '../models/workoutData.dart';
import '../workout/roundInfoContainer.dart';

class DetailsPage extends StatelessWidget {

  SubCategory? subCategory;

  DetailsPage ({ this.subCategory });

  @override
  Widget build(BuildContext context) {

    Color tileColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.white10 : Colors.white70;
    Color txtColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.white70 : Colors.white70;

    return Scaffold(
      appBar: MainAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/'+this.subCategory!.imgName+'.jpg'),
                        fit: BoxFit.cover,
                        alignment:Alignment.center,
                      ),
                  ),
                ),//Image
                Positioned(
                  bottom: 10, left: 4,
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      '${this.subCategory!.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                ),//Title
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount:this.subCategory!.workout.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    tileColor: tileColor,
                    isThreeLine: true,
                    leading: Container(
                      width: 80,
                      height: 80,
                      child: Lottie.network(this.subCategory!.workout[index].workoutLink, animate: true,),
                    ),
                    title: Text(this.subCategory!.workout[index].workoutName),
                    subtitle: Text("Reps: " + this.subCategory!.workout[index].workoutDetail.toString()),

                    onTap: () {
                      showDialog(context: context,
                          builder:(context) => Dialog(
                              backgroundColor: tileColor,
                              insetPadding: EdgeInsets.all(10),
                              child: Container(
                                width: 400,
                                height: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Lottie.network(this.subCategory!.workout[index].workoutLink, animate: true,),
                                    Center(child: Text(this.subCategory!.workout[index].workoutName, style: TextStyle(fontSize: 44, color: txtColor),)),
                                  ],
                                ),
                              )
                          )
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
