
import 'package:flutter/material.dart';
import 'package:project/helper/utils.dart';
import 'package:project/models/category.dart';
import 'package:project/helper/appcolors.dart';
import 'package:project/helper/utils.dart';
import 'package:project/models/category.dart';
import 'package:project/pages/selectedcategorypage.dart';
import 'package:project/pages/welcomepage.dart';
import 'package:project/widgets/categorybottombar.dart';
import 'package:project/widgets/categorycard.dart';
import 'package:project/widgets/iconfont.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:project/widgets/navigationdrawer.dart';
import 'package:project/widgets/custom_page_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

SharedPreferences? preferences;

class CategoryListPage extends StatefulWidget {

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {

  Future getTheme() async {
    preferences = await SharedPreferences.getInstance();
    bool? isDark = preferences!.getBool('theme');
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    provider.toggleTheme(isDark!);
  }

  void initState(){
    getTheme();
  }


  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: NavigationDrawer(),
        ),
        appBar: MainAppBar(),
        body: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child:  Center(
                          child: Text('Select a Category:',
                              style: TextStyle(color: AppColors.main_color)
                          )
                      )
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            bottom: 60,
                          ),
                          itemCount: categories.length,
                          itemBuilder: (BuildContext ctx, int index){
                            return CategoryCard(
                                category: categories[index],
                                onCardClick:(){
                                  Navigator.of(context).push(
                                      CustomPageRoute(routePage: SelectedCategoryPage(
                                        selectedCategory: this.categories[index],
                                      ) ));

                                }
                            );
                          }
                      )
                  )
                ],
              ),

            ],
          ),
        )
    );
  }
}
