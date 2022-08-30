import 'package:flutter/material.dart';

import 'package:project/helper/appcolors.dart';
import 'package:project/widgets/iconfont.dart';

import 'categorylistpage.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('assets/imgs/welcome.jpg',
                      fit: BoxFit.cover,)
                ) ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 140,
                          height: 140,
                          color: AppColors.main_color,
                          alignment: Alignment.center,
                          child: IconFont(
                            iconName: 'a',
                            color: AppColors.text,
                            size: 66,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.text,
                          fontSize: 33,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FlatButton(
                          onPressed: (){},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          color: Colors.white10,
                          padding: EdgeInsets.all(25),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FlatButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder:(context) => CategoryListPage()
                                )
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          color: Colors.white10,
                          padding: EdgeInsets.all(25),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                    ),

                  ]
              ),
            )

          ],
        ),

      ),
    );
  }
}