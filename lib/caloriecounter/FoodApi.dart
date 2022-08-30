
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/caloriecounter/SearchItemsModel.dart';


class FoodApi {
  static const apiKey = 'Sg9L4zWXLjNrLoJEGuuBbULcO4wEvgR9IIBHKXJ1';
  static const pageSize = '33';
  static const dataType = 'Survey%20%28FNDDS%29';

  static Future<List<String>> searchFood({required String query}) async {
    final url = 'https://api.nal.usda.gov/fdc/v1/foods/list?api_key=$apiKey&'
        'query=$query&dataType=$dataType&pageSize=$pageSize&sortBy=dataType.keyword&sortOrder=asc';


    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<String>((json) {
      final description = json['description'];
      final fdcId = json['fdcId'];

      return '$description:$fdcId';
    }).toList();

  }

  static Future<SearchResults> getDetails({required String query}) async {

    final url = 'https://api.nal.usda.gov/fdc/v1/food/$query?format=abridged&'
        'api_key=$apiKey&nutrients=208';

    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);

    return _convert2(body);

  }

  static SearchResults _convert2(json) {

    final fdcId = json['fdcId'];
    final description = json['description'];
    final dataType = json['dataType'];
    final publicationDate = json['publicationDate'];
    final foodCode = json['foodCode'];
    final foodNutrients = List<FoodNutrient>.from(json["foodNutrients"].map((x) => FoodNutrient.fromJson(x)));

    return SearchResults(
        fdcId: fdcId,
        description: description,
        dataType: dataType,
        publicationDate: publicationDate,
        foodCode: foodCode,
        foodNutrients: foodNutrients
    );
  }

}

