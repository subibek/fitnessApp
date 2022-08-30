import 'package:project/models/subcategory.dart';

class Workout{
  String workoutName;
  String workoutDetail;
  String workoutLink;
  List<Workout>? WorkoutList;

  Workout({
    required this.workoutName,
    required this.workoutDetail,
    required this.workoutLink,

  });
}