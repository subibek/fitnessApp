import 'package:project/models/subcategory.dart';
import 'package:project/models/workout.dart';

import '../models/category.dart';
import 'appcolors.dart';

class Utils{
  static List<Category> getMockedCategories(){
    return [
      Category(
          name: "Beginner",
          imgName: "cat1",
          color: AppColors.begin,
          subCategories: [
            SubCategory(
                color: AppColors.begin,
                name: "Easy",
                imgName: "bigin1",
                workout: [
                  Workout(
                      workoutName: 'Upward Facing Dog Pose',
                      workoutDetail: '3 x 15',
                      workoutLink: 'https://assets9.lottiefiles.com/packages/lf20_qynqmsel.json'
                  ),
                  Workout(
                      workoutName: 'Crunches',
                      workoutDetail: '3 x 20',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_Ajcy3F.json'
                  ),
                  Workout(
                      workoutName: 'Deadbug',
                      workoutDetail: '3 x 15',
                      workoutLink: 'https://assets10.lottiefiles.com/packages/lf20_munslzc6.json'
                  ),
                  Workout(
                      workoutName: 'Jumping Jack',
                      workoutDetail: '3 x 15',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_btqxjpsz.json'
                  ),
                  Workout(
                      workoutName: 'Leg Exercise',
                      workoutDetail: '3 x 10',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_6tqzumqa.json'
                  ),
                ]
            ),
            SubCategory(
                color: AppColors.begin,
                name: "Challenging",
                imgName: "bigin2",
                workout: [
                  Workout(
                      workoutName: 'Bridge',
                      workoutDetail: '3 x 5',
                      workoutLink: 'https://assets2.lottiefiles.com/packages/lf20_flq1qinv.json'
                  ),
                  Workout(
                      workoutName: 'Elbow To Knee Crunch',
                      workoutDetail: '3 x 8',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_sz79nzyi.json'
                  ),
                  Workout(
                      workoutName: 'Lunges',
                      workoutDetail: '3 x 8',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_citufxx3.json'
                  ),

                  Workout(
                      workoutName: 'Push up',
                      workoutDetail: '3 x 5',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_ovwj4nxv.json'
                  ),

                  Workout(
                      workoutName: 'Bulgarian Split Squat',
                      workoutDetail: '3 x 10',
                      workoutLink: 'https://assets7.lottiefiles.com/packages/lf20_zgrumob7.json'
                  ),
                ]
            ),
            SubCategory(
                color: AppColors.begin,
                name: "Hard",
                imgName: "bigin3",
                workout: [
                  Workout(
                      workoutName: 'Jumping Lunges',
                      workoutDetail: '3 x 10',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_citufxx3.json'
                  ),
                  Workout(
                      workoutName: 'Squat Jumps',
                      workoutDetail: '3 x 5',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_cz4aumeo.json'
                  ),
                  Workout(
                      workoutName: 'Seated abs circles',
                      workoutDetail: '3 x 10',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_7vvtae9t.json'
                  ),
                  Workout(
                      workoutName: 'Reverse Crunches',
                      workoutDetail: '3 x 5',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_3wvvdqvb.json'
                  ),
                  Workout(
                      workoutName: 'Bulgarian Split Squat',
                      workoutDetail: '3 x 10',
                      workoutLink: 'https://assets7.lottiefiles.com/packages/lf20_zgrumob7.json'
                  ),
                ]
            ),
          ]
      ),
      Category(
          name: "Intermediate",
          imgName: "cat2",
          color: AppColors.inter,
          subCategories: [
            SubCategory(
                color: AppColors.begin,
                name: "Easy",
                imgName: "inter1",
                workout: [
                  Workout(
                      workoutName: 'Upward Facing Dog Pose',
                      workoutDetail: '4 x 15',
                      workoutLink: 'https://assets9.lottiefiles.com/packages/lf20_qynqmsel.json'
                  ),
                  Workout(
                      workoutName: 'Crunches',
                      workoutDetail: '4 x 20',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_Ajcy3F.json'
                  ),
                  Workout(
                      workoutName: 'Deadbug',
                      workoutDetail: '4 x 25',
                      workoutLink: 'https://assets10.lottiefiles.com/packages/lf20_munslzc6.json'
                  ),
                  Workout(
                      workoutName: 'Jumping Jack',
                      workoutDetail: '4 x 30',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_btqxjpsz.json'
                  ),
                  Workout(
                      workoutName: 'Leg Exercise',
                      workoutDetail: '4 x 25',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_6tqzumqa.json'
                  ),
                ]
            ),
            SubCategory(
                color: AppColors.begin,
                name: "Challenging",
                imgName: "inter2",
                workout: [
                  Workout(
                      workoutName: 'Bridge',
                      workoutDetail: '4 x 25',
                      workoutLink: 'https://assets2.lottiefiles.com/packages/lf20_flq1qinv.json'
                  ),
                  Workout(
                      workoutName: 'Elbow To Knee Crunch',
                      workoutDetail: '4 x 30',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_sz79nzyi.json'
                  ),
                  Workout(
                      workoutName: 'Lunges',
                      workoutDetail: '4 x 30',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_citufxx3.json'
                  ),

                  Workout(
                      workoutName: 'Push up',
                      workoutDetail: '4 x 25',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_ovwj4nxv.json'
                  ),

                  Workout(
                      workoutName: 'Bulgarian Split Squat',
                      workoutDetail: '4 x 15',
                      workoutLink: 'https://assets7.lottiefiles.com/packages/lf20_zgrumob7.json'
                  ),
                ]
            ),
            SubCategory(
                color: AppColors.begin,
                name: "Hard",
                imgName: "inter3",
                workout: [
                  Workout(
                      workoutName: 'Jumping Lunges',
                      workoutDetail: '4 x 20',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_citufxx3.json'
                  ),
                  Workout(
                      workoutName: 'Squat Jumps',
                      workoutDetail: '4 x 25',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_cz4aumeo.json'
                  ),
                  Workout(
                      workoutName: 'Seated abs circles',
                      workoutDetail: '4 x 20',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_7vvtae9t.json'
                  ),
                  Workout(
                      workoutName: 'Reverse Crunches',
                      workoutDetail: '4 x 20',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_3wvvdqvb.json'
                  ),
                  Workout(
                      workoutName: 'Bulgarian Split Squat',
                      workoutDetail: '4 x 15',
                      workoutLink: 'https://assets7.lottiefiles.com/packages/lf20_zgrumob7.json'
                  ),
                ]
            ),
          ]
      ),
      Category(
          name: "Advanced",
          imgName: "cat3",
          color: AppColors.advance,
          subCategories: [
            SubCategory(
                color: AppColors.begin,
                name: "Easy",
                imgName: "advan1",
                workout: [
                    Workout(
                    workoutName: 'Upward Facing Dog Pose',
                    workoutDetail: '5 x 25',
                    workoutLink: 'https://assets9.lottiefiles.com/packages/lf20_qynqmsel.json'
                    ),
                    Workout(
                        workoutName: 'Crunches',
                        workoutDetail: '5 x 40',
                        workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_Ajcy3F.json'
                    ),
                    Workout(
                        workoutName: 'Deadbug',
                        workoutDetail: '5 x 25',
                        workoutLink: 'https://assets10.lottiefiles.com/packages/lf20_munslzc6.json'
                    ),
                    Workout(
                        workoutName: 'Jumping Jack',
                        workoutDetail: '5 x 30',
                        workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_btqxjpsz.json'
                    ),
                    Workout(
                        workoutName: 'Leg Exercise',
                        workoutDetail: '5 x 20',
                        workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_6tqzumqa.json'
                    ),
                ]
            ),
            SubCategory(
                color: AppColors.begin,
                name: "Challenging",
                imgName: "advan2",
                workout: [
                  Workout(
                      workoutName: 'Bridge',
                      workoutDetail: '5 x 25',
                      workoutLink: 'https://assets2.lottiefiles.com/packages/lf20_flq1qinv.json'
                  ),
                  Workout(
                      workoutName: 'Elbow To Knee Crunch',
                      workoutDetail: '5 x 30',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_sz79nzyi.json'
                  ),
                  Workout(
                      workoutName: 'Lunges',
                      workoutDetail: '5 x 30',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_citufxx3.json'
                  ),

                  Workout(
                      workoutName: 'Push up',
                      workoutDetail: '5 x 35',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_ovwj4nxv.json'
                  ),

                  Workout(
                      workoutName: 'Bulgarian Split Squat',
                      workoutDetail: '5 x 25',
                      workoutLink: 'https://assets7.lottiefiles.com/packages/lf20_zgrumob7.json'
                  ),
                ]
            ),
            SubCategory(
                color: AppColors.begin,
                name: "Hard",
                imgName: "advan3",
                workout: [
                  Workout(
                      workoutName: 'Jumping Lunges',
                      workoutDetail: '5 x 35',
                      workoutLink: 'https://assets8.lottiefiles.com/packages/lf20_citufxx3.json'
                  ),
                  Workout(
                      workoutName: 'Squat Jumps',
                      workoutDetail: '5 x 35',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_cz4aumeo.json'
                  ),
                  Workout(
                      workoutName: 'Seated abs circles',
                      workoutDetail: '5 x 30',
                      workoutLink: 'https://assets4.lottiefiles.com/packages/lf20_7vvtae9t.json'
                  ),
                  Workout(
                      workoutName: 'Reverse Crunches',
                      workoutDetail: '5 x 30',
                      workoutLink: 'https://assets5.lottiefiles.com/packages/lf20_3wvvdqvb.json'
                  ),
                  Workout(
                      workoutName: 'Bulgarian Split Squat',
                      workoutDetail: '5 x 30',
                      workoutLink: 'https://assets7.lottiefiles.com/packages/lf20_zgrumob7.json'
                  ),
                ]
            ),
          ]
      ),
    ];
  }
}