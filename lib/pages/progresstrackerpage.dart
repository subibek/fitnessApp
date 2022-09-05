import 'package:flutter/material.dart';
import 'package:project/login/loginPage.dart';
import 'package:project/models/pTrackerData.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:project/widgets/navigationdrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import '../helper/appcolors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProgressTracker extends StatefulWidget {
  const ProgressTracker({Key? key}) : super(key: key);

  @override
  _ProgressTrackerState createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {

  String? currentUser = LoginPage.currentUser;
  List<Data> data = [];
  TooltipBehavior _toolTip = new TooltipBehavior();
  bool buttonVisible = true;
  final _updateTracker = TextEditingController();

  @override
  void initState() {
    getData();
    _toolTip = TooltipBehavior(enable:true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: MainAppBar(),
      body: Padding(
              padding: EdgeInsets.fromLTRB(4, 0, 6, 66),
              child: SfCartesianChart(
                enableAxisAnimation: true,
                title: ChartTitle(
                    text: 'Progress Analysis',
                    textStyle: TextStyle(fontFamily: 'Lobster')
                ),
                legend: Legend(isVisible: true),
                tooltipBehavior: _toolTip,
                series: <ChartSeries>[
                  LineSeries<Data, DateTime>(
                      name: 'Weight',
                      dataSource: data,
                      xValueMapper: (Data val, _) => val.date,
                      yValueMapper: (Data val, _) => val.weight,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true)
                  )
                ],
                primaryXAxis: DateTimeAxis(
                    intervalType: DateTimeIntervalType.days,
                    rangePadding: ChartRangePadding.additional
                ),
                primaryYAxis: NumericAxis(
                    labelFormat: '{value} Kg',
                    interval: 1),

              ),
          ),
          floatingActionButton: Visibility(
            visible: buttonVisible,
            child: FloatingActionButton.extended(
              onPressed: () {
                    updateTracker(context);
              },
              label: Text('Update Tracker',style: TextStyle(
                  color: Theme.of(context).primaryColor == Colors.black54
                      ? Colors.black : Colors.white
              ),),
              backgroundColor: Theme.of(context).primaryColor == Colors.black54
                  ? Colors.white70 : Colors.black,
            ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future updateTracker(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: EdgeInsets.zero,
        title: Center(
          child: Text('Update Tracker'),
        ),
        content: Form(child: TextFormField(
          controller: _updateTracker,
          decoration: InputDecoration(
              hintText: 'Enter your current weight',
              focusedBorder: OutlineInputBorder(),
              border: OutlineInputBorder()
          ),
        ),),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context,'Cancel'),
              child: const Text('Cancel',style: TextStyle(color: AppColors.main_color),)
          ),
          TextButton(
              onPressed: (){

                int weight = int.parse(_updateTracker.text);
                DateTime date = DateTime.now();

                addDate(date: date, weight: weight);

                Navigator.pop(context,'update');
              },
              child: const Text('Update',style: TextStyle(color: AppColors.main_color)))
        ],
      )
  );

  getData() {

    FirebaseFirestore.instance.collection(currentUser!).orderBy("date").get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Map<String, dynamic> val = result.data();
        var timeStamp = val['date'];
        var date = timeStamp.toDate();
        var weight = val['weight'];

        if(DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(DateTime.now())){
          setState(() => buttonVisible = false);
        }

        Data item = Data(date: date, weight: weight);

        setState(() => data.add(item));
      });
    });
  }

  Future addDate({required DateTime date,required int weight}) async {
    final docpTracker = FirebaseFirestore.instance.collection(currentUser!).doc();

    final item = Data(
        date: date,
        weight: weight
    );

    final json = item.toJson();

    await docpTracker.set(json);
    setState(() => buttonVisible = false);
  }
}







