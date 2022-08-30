import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/timer/workoutTimer.dart';
import '../models/workoutData.dart';
import '../workout/roundInfoContainer.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/bigin4.jpg'),
                        fit: BoxFit.cover,
                        alignment:Alignment.center,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      )
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1,sigmaY: 2),
                    child: Container(
                      color: Colors.white.withOpacity(.123),
                    ),
                  ),
                ),//Image
                Positioned(
                    top: 20,left: 10, right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          color: Colors.white,
                          onPressed: (){},//  Navigator.pop(context);
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          color: Colors.white,
                          onPressed: (){},
                        )
                      ],
                    )
                ),//Icon
                Positioned(
                  bottom: 20.0, left: 10, right: 10,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Text(
                          'Start Workout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center ,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const RoundInfoContainer(
                              title: '10',

                          ),
                          _divider(),
                          const RoundInfoContainer(
                              title: 'EASY',

                          ),
                        ],
                      ),
                    ],
                  ),
                ),//Title
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: workout.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    isThreeLine: true,
                    leading: Container(
                      width: 90.0,
                      child: Lottie.network(workout[index]['leading'], animate: true,),
                    ),
                    title: Text(workout[index]['title']),
                    subtitle: Text(workout[index]['subtitle']),
                    trailing: workout[index]['trailing'],
                    // onTap: Navigator.of(context).pushNamed(root.WorkoutTimer),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Start'),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _divider(){
    return Container(
      width: 1.2,
      height: 35,
      color: Colors.white.withOpacity(.4),
    );
  }
}