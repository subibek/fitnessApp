import 'package:flutter/material.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/pages/caloriecounterpage.dart';
import 'package:project/widgets/navigationdrawer.dart';

import '../pages/progresstrackerpage.dart';

class CategoryBottomBar extends StatelessWidget {
  const CategoryBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(0.4),
                offset: Offset.zero
            )
          ]
      ),
      height: 58,
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.favorite, color:AppColors.main_color),
                onPressed: (){},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.add, color:AppColors.main_color),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalorieCounter()));
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.add_chart, color:AppColors.main_color),
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProgressTracker()
                    ));
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}
