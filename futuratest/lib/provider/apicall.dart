import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall with ChangeNotifier {
  List<String> imageUrl = [];
  void getData(String item) async {
    final url = Uri.parse(
      "https://pixabay.com/api/?key=36479055-9b342102033a4c04003014b9d&q=$item&image_type=photo",
    );
    print(
        "https://pixabay.com/api/?key=36479055-9b342102033a4c04003014b9d&q=$item&image_type=photo&pretty=true");
    final response = await http.get(url);
    final listdata = json.decode(response.body);
    final List<dynamic> hits = listdata['hits'];
    imageUrl = [];
    for (var hit in hits) {
      final webformatURL = hit['webformatURL'];
      imageUrl.add(webformatURL);
      
    }
    print(imageUrl.length);
    notifyListeners();
  }
}
