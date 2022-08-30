import 'dart:async';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:project/models/workoutData.dart';

import '../models/workout.dart';
import 'buttonWidget.dart';

class WorkoutTimer extends StatefulWidget {

  List<Workout> workouts;

  WorkoutTimer ({ required this.workouts });

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  int _duration = 60;


  void resetTimer() => setState(() => seconds = maxSeconds);

  void stopTimer({bool reset = true}){
    if(reset){
      resetTimer();
    }
    setState(()=> timer?.cancel());
  }

  startTimer({bool reset = true}){
    if(reset){
      resetTimer();
    }
    timer = Timer.periodic(Duration(milliseconds: _duration), (_){
      if(seconds > 0){
        setState(() => seconds--);
      } else{
        stopTimer(reset: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: workoutBuilder()
      ),
    );
  }

  workoutBuilder() {

    for(int i = 0; i< widget.workouts.length ; i++){

     return Container(
        width: 400,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(widget.workouts[i].workoutLink, animate: true,),
            Center(child: Text(widget.workouts[i].workoutName, style: TextStyle(fontSize: 24),)),
          ],
        ),
      );
    }
  }

  Widget buildButtons(){
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;

    return isRunning || !isCompleted
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
            text: isRunning ?'Pause':'Resume',
            color: Colors.black,
            backgroundColor: Colors.white,
            onClicked: (){
              if(isRunning){
                stopTimer(reset: false);
              } else{
                startTimer(reset: false);
              }
            }
        ),
        const SizedBox(width: 12),
        ButtonWidget(
          text: 'Reset',
          color: Colors.black,
          backgroundColor: Colors.white,
          onClicked: (){ stopTimer(); },
        )
      ],
    )
        :ButtonWidget(
      text: 'Start Timer',
      color: Colors.black,
      backgroundColor: Colors.white,
      onClicked: (){ startTimer(); },
    );
  }

  Widget buildTimer() => SizedBox(
    width: 100,
    height: 100,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: 1 - seconds / maxSeconds,
          strokeWidth: 6,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
          backgroundColor: Colors.black,
        ),
        Center(child: buildTime())
      ],
    ),
  );

  Widget buildTime(){
    return Text(
      '$seconds',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 40,
      ),
    );
  }
}