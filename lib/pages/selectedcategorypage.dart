import 'package:flutter/material.dart';
import 'package:project/models/category.dart';
import 'package:project/models/subcategory.dart';
import 'package:project/widgets/categorycard.dart';
import 'package:project/widgets/mainappbar.dart';
import 'package:project/widgets/custom_page_route.dart';
import 'detailspage.dart';

class SelectedCategoryPage extends StatelessWidget {

  Category? selectedCategory;

  SelectedCategoryPage ({ this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text(this.selectedCategory!.name,
                  style: TextStyle(
                      color: this.selectedCategory!.color, fontSize: 20),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: 50,
                    ),
                    itemCount: selectedCategory!.subCategories!.length,
                    itemBuilder: (BuildContext ctx, int index){
                      return CategoryCard(
                          category: this.selectedCategory!.subCategories![index],
                          onCardClick:(){
                            Navigator.of(context).push(
                                CustomPageRoute(routePage: DetailsPage(
                                  subCategory: this.selectedCategory!.subCategories![index] as SubCategory,
                                ) ));
                          }
                      );
                    }
                )
            )],
        ),

      )
    );
  }
}
