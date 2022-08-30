import 'package:flutter/material.dart';
import 'package:project/caloriecounter/SearchItemsModel.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/login/loginPage.dart';
import '../models/foodDetails.dart';
import '../pages/caloriecounterpage.dart';
import 'FoodApi.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class CalorieCounterHomePage extends StatefulWidget {
  const CalorieCounterHomePage({Key? key}) : super(key: key);

  @override
  _CalorieCounterHomePageState createState() => _CalorieCounterHomePageState();
}

class _CalorieCounterHomePageState extends State<CalorieCounterHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Food'),
          centerTitle: true,
        actions: [
          IconButton(
          icon: Icon(Icons.search),
          onPressed: ()  async {
             showSearch(
                context: context,
                delegate: FoodSearch()
            );

    },
          )
        ],
    backgroundColor: AppColors.main_color,
      ),
    );
  }
}

class FoodSearch extends SearchDelegate<String> {

  final value = TextEditingController();
  String currentUser = LoginPage.currentUser!;

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          if (query.isEmpty) {
            close(context, '');
          }else{
            query = '';
            showSuggestions(context);
          }
        })
  ];

  @override
  Widget? buildLeading(BuildContext context) =>
    IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, '')

        );


  @override
  Widget buildSuggestions(BuildContext context) => Container(
    color: Colors.black12,
    child: FutureBuilder<List<String>>(
        future:FoodApi.searchFood(query: query),
        builder: (context, snapshot) {
          if (query.isEmpty) return buildNoSuggestions();

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError || snapshot.data == null){
                return buildNoSuggestions();
              }
              else {
                return buildSuggestionsSuccess(snapshot.data!);
                }
          }
        }
    ),
  );

  Widget buildNoSuggestions() => Center(
    child: Text(
        'No Suggestions!',
        style: TextStyle(fontSize: 28, color: Colors.black),),
  );

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index){
        final suggestion = suggestions[index];
        final i = suggestion.indexOf(":");
        final fdcId = suggestion.substring(i+1).trim();

        final name = suggestion.substring(0,i);

        final queryText = (name).substring(0,query.length);
        final remainingText = (name).substring(query.length);

        return ListTile(
          onTap: (){
            query = fdcId;
            showResults(context);
          },
          leading: Icon(Icons.restaurant),
          title: RichText(
            text: TextSpan(
              text: queryText,
              style: TextStyle(
                color: Theme.of(context).primaryColor == Colors.black54
                  ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: remainingText,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  )
                ),
              ]
            ),
          )
        );
      });

  @override
  Widget buildResults(BuildContext context) => FutureBuilder<SearchResults>(
    future: FoodApi.getDetails(query: query),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'Something went wrong',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              );
            } else {
              return buildResultSuccess(snapshot.data!,context);
            }
        }
      }
  );

  Widget buildResultSuccess(SearchResults food, BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
  ),
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
            Text(
              food.description,
            style: TextStyle(
            fontSize: 33,
            color: AppColors.main_color,
            ),
            textAlign: TextAlign.center,
            ),
              SizedBox(height:44),
              Text(
                'Calories per 100g: ',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.main_color,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:10),
              Text(
                food.foodNutrients[0].amount + " cal",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.main_color,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:44),
              Text(
                'Enter serving size (in gm):',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.main_color,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height:10),
              TextFormField(
                controller: value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: '100',
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height:10),
              OutlinedButton(
                  onPressed: () async {
                    double data;
                    if (value.text.isEmpty){
                      data = 100;
                    }
                    else
                      {data = double.parse(value.text);}
                    double cal = ((double.parse(food.foodNutrients[0].amount))/100*data);
                  addFoodDetails(username: currentUser, name: food.description, calories: cal, per100: double.parse(food.foodNutrients[0].amount));
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text('Add Food', style: TextStyle(
                      fontSize: 16,
                      color: AppColors.main_color,
                    ),
                    ),
                  )
                  ),


      ]
    )
  );
  }


Future addFoodDetails({required String username,required String name, required double calories, required double per100}) async {
  final docFoodDetails = FirebaseFirestore.instance.collection('foodDetails').doc(name);

  final food = FoodDetails(
      username: username,
      description: name,
      calories: calories,
      per100: per100,
      date: DateFormat('yyyy-MM-dd').format(new DateTime.now())
  );

  final json = food.toJson();

  await docFoodDetails.set(json);
}

