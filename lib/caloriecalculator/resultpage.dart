import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/models/userInfo.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultPage extends StatefulWidget {

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String currentUser = LoginPage.currentUser!;

  double bmi = 0.0;
  String bmiScale = '';
  String tdee= '';
  String goalCalories = '';
  double width = 18;
  final double _fontSize = 16;
  String infoDetails = '';

  @override
  Widget build(BuildContext context) {
    getInfo();

    Color dialogBgColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.white12 : Colors.white70;
    Color txtColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.white : Colors.black87;
    Color foregroundColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.white: Colors.black87;
    Color tileColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.black87 : Colors.grey;
    Color dialogColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.black87 : Colors.white12;
    Color scaffoldColor = Theme.of(context).primaryColor == Colors.black54 ? Colors.black87 : Colors.transparent;



    return Scaffold(
      appBar: AppBar(backgroundColor: scaffoldColor, foregroundColor: foregroundColor),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 33, 0, 0),
                child: Text('BMI',style: TextStyle(fontSize: 24),),
              ),
            ),
            Center(
                child: Padding(
                  padding: EdgeInsets.all(33),
                  child: SfRadialGauge(
                      enableLoadingAnimation: true,
                      animationDuration: 2400,
                      axes: <RadialAxis>[RadialAxis(maximum: 50, minimum: 0,
                        showAxisLine: false,
                        pointers: <GaugePointer>[
                          NeedlePointer(value: bmi, enableAnimation: true,)
                        ],
                        ranges: <GaugeRange>[
                          GaugeRange(startWidth: width, endWidth: width, startValue: 0, endValue: 16, color: Colors.redAccent[700],),
                          GaugeRange(startWidth: width, endWidth: width,startValue: 16, endValue: 17, color: Colors.red[400],),
                          GaugeRange(startWidth: width, endWidth: width,startValue: 17, endValue: 18.5, color: Colors.yellow[600],),
                          GaugeRange(startWidth: width, endWidth: width,startValue: 18.5, endValue: 25, color: Colors.green[600],),
                          GaugeRange(startWidth: width, endWidth: width,startValue: 25, endValue: 35, color: Colors.yellow[600],),
                          GaugeRange(startWidth: width, endWidth: width,startValue: 35, endValue: 40, color: Colors.red[300],),
                          GaugeRange(startWidth: width, endWidth: width,startValue: 40, endValue: 50, color: Colors.redAccent[700],),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(bmi.toStringAsFixed(2), style: TextStyle(fontSize: 20,),),
                            positionFactor: 0.5,
                            angle: 90,
                          )
                        ],
                      )]
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(

                  onTap: (){
                    showDialog(context: context,
                        builder:(context) => Dialog(
                        backgroundColor: dialogBgColor,
                        insetPadding: EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text('BMI Scale Categories:',style: TextStyle(fontSize: 20,color: txtColor)),
                                    SizedBox(height: 10,),
                                    Text('Underweight = < 18.5',style: TextStyle(fontSize: 17,color: txtColor)),
                                    Text('Normal weight = 18.5 – 24.9',style: TextStyle(fontSize: 17,color: txtColor)),
                                    Text('Overweight = 25 – 29.9',style: TextStyle(fontSize: 17,color: txtColor)),
                                    Text('Obese = 30 or greater',style: TextStyle(fontSize: 17,color: txtColor))
                                  ],
                                ),
                              )
                            ),
                          ],
                        )
                    )
                    );
                  },
                  tileColor: tileColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  leading: Text('BMI Scale :',style: TextStyle(color: txtColor,fontSize: _fontSize),),
                  trailing: Text(bmiScale,style: TextStyle(color: txtColor,fontSize: _fontSize)),
                )
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  onTap: (){
                    showDialog(context: context,
                        builder:(context) => Dialog(
                            backgroundColor: dialogColor,
                            insetPadding: EdgeInsets.all(10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: dialogColor
                                    ),
                                    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text('Total Daily Energy Expenditure (TDEE) is an estimation of how many calories you '
                                              'burn per day when exercise is taken into account.',style: TextStyle(fontSize: 17,color: txtColor)),
                                        ],
                                      ),
                                    )
                                ),
                              ],
                            )
                        )
                    );
                  },
                  tileColor: tileColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  leading: Text('TDEE :',style: TextStyle(color: txtColor,fontSize: _fontSize)),
                  trailing: Text(tdee,style: TextStyle(color: txtColor,fontSize: _fontSize)),
                )
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  onTap: (){
                    showDialog(context: context,
                        builder:(context) => Dialog(
                            backgroundColor: dialogColor,
                            insetPadding: EdgeInsets.all(10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: dialogColor
                                    ),
                                    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text('The Goal Calorie is an estimate of the number of calories needed each day to maintain, lose, or gain weight'
                                          ,style: TextStyle(fontSize: 17,color: txtColor),),
                                        ],
                                      ),
                                    )
                                ),

                              ],
                            )
                        )
                    );
                  },
                  tileColor: tileColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  leading: Text('Goal Calories :',style: TextStyle(color:txtColor, fontSize: _fontSize)),
                  trailing: Text(goalCalories,style: TextStyle(color: txtColor,fontSize: _fontSize)),
                )
            ),

          ],
        )
    );
  }

  getInfo() async {
    final snapshot = await FirebaseFirestore.instance.collection('userInfo').doc(currentUser).get();
    final data = snapshot.data();

    setState(() => bmi = data!['bmi'].toDouble());
    setState(() => bmiScale = data!['bmiScale']);
    setState(() => tdee = data!['tdee'].toString());
    setState(() => goalCalories = data!['totalCalories'].toString());

  }

}


