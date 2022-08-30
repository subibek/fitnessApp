import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/category.dart';

class CategoryCard  extends StatelessWidget {

  Category? category;
  Function? onCardClick;

  CategoryCard({ this.category, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        this.onCardClick!();
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/'+this.category!.imgName+'.jpg'),
                        fit:BoxFit.cover,
                      )
                  ),

                ),

              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)
                    ),

                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ]
                    )
                ),
              ),

            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(this.category!.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
