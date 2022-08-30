import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/caloriecalculator/caloriecalculator.dart';
import 'package:project/caloriecalculator/enums.dart';
import 'package:project/caloriecalculator/resultpage.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/widgets/mainappbar.dart';

import '../models/userInfo.dart';



class CounterPage extends StatefulWidget {

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late String username;
  late double weight;
  late double height;
  late int age;
  late ActivityLevel activityLevel;
  late Goal goal;
  late Gender gender;
  late DateTime createdTime;

  final inputHeight = TextEditingController();
  final inputWeight = TextEditingController();
  final inputAge = TextEditingController();
  late Gender inputGender = Gender.male;
  late ActivityLevel inputActivityLevel = ActivityLevel.Moderate;
  late Goal inputGoal = Goal.Maintain;
  String currentUser = LoginPage.currentUser!;

  void setGender(Gender gender){
    this.inputGender = gender;
  }
  void setActivityLevel(ActivityLevel activityLevel){
    this.inputActivityLevel = activityLevel;
  }
  void setGoal(Goal goal){
    this.inputGoal = goal;
  }


  final _formKey = GlobalKey();
  final _heightFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _activityLevelFocusNode = FocusNode();
  final _goalFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();
  final double _fontSize = 20;
  final double _sizedBoxHeight = 24;

  String userName = 'admin';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main_color,
        title: Text('User Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Height: (cm)',style: TextStyle(fontSize: _fontSize)),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: inputHeight,
                      keyboardType: TextInputType.number,
                      focusNode: _heightFocusNode,
                      onSaved: (newValue) {
                        print('height: $newValue');
                      },
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Enter your height in cm';
                        }
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_weightFocusNode);
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Height',
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: _sizedBoxHeight),
                    Text('Weight: (kg)',style: TextStyle(fontSize: _fontSize)),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: inputWeight,
                      keyboardType: TextInputType.number,
                      focusNode: _weightFocusNode,
                      onSaved: (newValue) {
                        print('weight: $newValue');
                      },
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Enter your weight in kg';
                        }
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_ageFocusNode);
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Weight',
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: _sizedBoxHeight),
                    Text('Age:',style: TextStyle(fontSize: _fontSize)),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: inputAge,
                      keyboardType: TextInputType.number,
                      focusNode: _ageFocusNode,
                      onSaved: (newValue) {
                        print('age: $newValue');
                      },
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Enter your age';
                        }
                      },
                      onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_genderFocusNode);
                      },

                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Age',
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: _sizedBoxHeight),
                    Text('Gender:',style: TextStyle(fontSize: _fontSize)),
                    DropdownButtonFormField(
                        focusNode: _genderFocusNode,
                        items: Gender.values.map((Gender value){
                          return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value.toString().split('.').last,
                              ));
                        }).toList(),
                        onChanged: (val){
                            setGender(val as Gender);
                            FocusScope.of(context).requestFocus(_activityLevelFocusNode);
                        }

        ),
                    SizedBox(height: _sizedBoxHeight),
                    Text('Actvity Level:',style: TextStyle(fontSize: _fontSize)),
                    DropdownButtonFormField(
                      focusNode: _activityLevelFocusNode,
                      items: ActivityLevel.values.map((ActivityLevel value){
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value.toString().split('.').last,
                            ));
                      }).toList(),
                      onChanged: (val){
                        setActivityLevel(val as ActivityLevel);
                        FocusScope.of(context).requestFocus(_goalFocusNode);
                      },

                    ),
                    SizedBox(height: _sizedBoxHeight),
                    Text('Goal:', style: TextStyle(fontSize: _fontSize)),
                    DropdownButtonFormField(
                        focusNode: _goalFocusNode,
                        items: Goal.values.map((Goal value){
                          return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value.toString().split('.').last,
                              ));
                        }).toList(),
                        onChanged: (val){
                            setGoal(val as Goal);
                        }),
                    SizedBox(height: _sizedBoxHeight,),
                    OutlinedButton(
                        onPressed: (){
                          calorieCalculator calc = calorieCalculator(
                            height: double.parse(inputHeight.text),
                            weight: double.parse(inputWeight.text),
                            age: int.parse(inputAge.text),
                            activityLevel: inputActivityLevel,
                            gender: inputGender,
                            goal: inputGoal,
                          );

                          double totalCal = calc.totalCalories();
                          double bmi = calc.bmi();
                          double tdee = calc.tdee();
                          String bmiScale = calc.bmiScale();

                          addUserInfo(totalCal, bmi, tdee, bmiScale);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage())
                          );

                        },
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size((MediaQuery.of(context).size.width),60),
                          backgroundColor: AppColors.main_color
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Submit', style: TextStyle(
                            fontSize: _fontSize,
                            color: Colors.white,
                          ),
                          ),
                        )
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
    
    
  }
  
  Future addUserInfo (double totalCal, double bmi, double tdee, String bmiScale) async {

    final docUserInfo = FirebaseFirestore.instance.collection('userInfo').doc(currentUser);

    final user = UserInform(
        username: currentUser,
        height: double.parse(inputHeight.text),
        weight: double.parse(inputWeight.text),
        age: int.parse(inputAge.text),
        activityLevel: inputActivityLevel.toString(),
        goal: inputGoal.toString(),
        gender: inputGender.toString(),
        totalCalories: totalCal,
        bmi: bmi,
        tdee: tdee,
        bmiScale: bmiScale,
    );

    final json = user.toJson();
    await docUserInfo.set(json);
  }
}

