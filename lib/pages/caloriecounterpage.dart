import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/caloriecounter/home_page.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/models/userInfo.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:intl/intl.dart';
import '../models/foodDetails.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../widgets/navigationdrawer.dart';

class CalorieCounter extends StatefulWidget {
  const CalorieCounter({Key? key}) : super(key: key);

  @override
  State<CalorieCounter> createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  final _inputUpdate = TextEditingController();
  String currentUser = LoginPage.currentUser!;
  String dateTitle = '< Today >';
  String Date = (DateFormat('yyyy-MM-dd').format(new DateTime.now()));

  double totalCal = 0;
  double GoalCal = 0;
  bool buttonVisible = true;
  DateTime datePickerCurrentDate = new DateTime.now();


  @override
  Widget build(BuildContext context) {
    getGoalCal();
    final btnColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.white : Colors.black;

    final txtColor = Theme.of(context).primaryColor == Colors.black54
        ? Colors.black : Colors.white;

    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: MainAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14),
            child: ListTile(

              onTap: (){
                DatePicker.showDatePicker(context,
                    theme:  DatePickerTheme(
                        headerColor: Colors.black45,
                        backgroundColor: AppColors.main_color,
                        itemStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18),
                        doneStyle:
                        TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold,)),
                    currentTime: datePickerCurrentDate,
                    showTitleActions: true,
                    minTime: DateTime(2020,1,1),
                    maxTime: DateTime.now(),
                    onChanged: (date){

                    },
                    onConfirm: (date) {
                      setState(() => Date = (DateFormat('yyyy-MM-dd').format(date)));
                      setState(() => datePickerCurrentDate = date);

                      final now = DateTime.now();

                      if(DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, now.day)).toString()){
                        setState(() => dateTitle = '< Today >');
                        setState(() => buttonVisible = true);
                      }
                      else if(date == DateTime(now.year, now.month, now.day - 1)){
                        setState(() => dateTitle = '< Yesterday >');
                        setState(() => buttonVisible = false);
                      }
                      else {
                        setState(() => (dateTitle = "< ${(DateFormat('yyyy-MM-dd').format(date)).toString()} >"));
                        setState(() => buttonVisible = false);
                      }


                    }

                );
              },
              title: Center(child: Text(dateTitle, style: TextStyle(color: txtColor, fontSize: 40),),),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              tileColor: btnColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Calories Remaining', style: TextStyle(fontSize: 20),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(14), child: Column(children: [Text(GoalCal.toStringAsFixed(2),style: TextStyle(fontSize: 20),), Text('Goal',style: TextStyle(fontSize: 12,color: AppColors.begin),)])),
                  Padding(padding: EdgeInsets.all(14), child: Column(children: [Text('-'), Text('-')],),),
                  Padding(padding: EdgeInsets.all(14), child: Column(children: [Text(totalCal.toStringAsFixed(2),style: TextStyle(fontSize: 20)), Text('Consumed',style: TextStyle(fontSize: 12,color: AppColors.inter))],),),
                  Padding(padding: EdgeInsets.all(14), child: Column(children: [Text('='), Text('=')],),),
                  Padding(padding: EdgeInsets.all(14), child: Column(children: [Text((GoalCal-totalCal).toString(),style: TextStyle(fontSize: 20)), Text('Remaining',style: TextStyle(fontSize: 12,color: AppColors.advance))],))

                ],
              ),
            ],
          ),

          Flexible(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('foodDetails').where('date', isEqualTo: Date).where('username', isEqualTo: currentUser)
                    .snapshots(),

                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((doc) {
                        totalCal = snapshot.data!.docs.fold(0, (previousValue, element) =>
                        (doc['date'].toString() == Date && currentUser == doc['username'])? previousValue + element['calories']: 0);
                        return Padding(
                            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              onTap: (){
                                openDialog(context, doc['description'], doc['per100']);
                              },
                              title: Text(doc['description']),
                              subtitle: Text('Kcal: '+doc['calories'].toStringAsFixed(2)),
                              trailing: Icon(Icons.more_vert),
                            )
                        );
                      }).toList(),

                    );
                  }
                  else if (snapshot.hasError) {
                    return Text(snapshot.toString());
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),

          ),

        ],
      ),
      floatingActionButton: Visibility(
        visible: buttonVisible,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CalorieCounterHomePage()));
          },
          icon: Icon(Icons.add,color: txtColor,),
          label: Text('Add Food',style: TextStyle(
              color: txtColor
          ),
          ),
          backgroundColor: btnColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future openDialog(BuildContext context, String food, double per100) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(food),
        ),
        content: Form(child: TextFormField(
          controller: _inputUpdate,
          decoration: InputDecoration(
              hintText: 'Input portion size in gm',
              focusedBorder: OutlineInputBorder(),
              border: OutlineInputBorder()
          ),
        )
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context,'Cancel'),
                  child: const Text('Cancel',style: TextStyle(color: AppColors.main_color, fontSize: 16),)),
              TextButton(
                  onPressed: () {
                    double cal = double.parse(_inputUpdate.text)*(per100/100);
                    final docFood = FirebaseFirestore.instance
                        .collection('foodDetails')
                        .doc(food);

                    docFood.update({
                      'calories' : cal.toInt(),
                    });
                    Navigator.pop(context,'Update');
                  },
                  child: const Text('Update',style: TextStyle(color: AppColors.main_color,fontSize: 16))),
              TextButton(
                  onPressed: () {
                    deleteDialog(context,food);
                  },

                  child: const Text('Delete',style: TextStyle(color: AppColors.main_color, fontSize: 16))),
            ],
          )
        ],
      )
  );

  Future deleteDialog(BuildContext context, String food) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete'),
        content: Text('Are you sure?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context,'No'),
              child: const Text('No')),
          TextButton(
              onPressed: () {
                final docFood = FirebaseFirestore.instance
                    .collection('foodDetails')
                    .doc(food);

                docFood.delete();
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
              child: const Text('Yes')),
        ],
      )
  );

  void getGoalCal() async {
    var Collection = FirebaseFirestore.instance.collection('userInfo');
    var docSnapshot = await Collection.doc(currentUser).get();

    if(docSnapshot.exists){
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['totalCalories'];

      setState(() => GoalCal = value);
    }
    else
      print("something went wrong");
  }

  }
