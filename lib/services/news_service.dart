import 'dart:convert';

import '../models/news.dart';

import 'package:http/http.dart' as http;

class NewsService {
  Future<List<News>> getNews() async {
    final url = Uri.parse(
        'https://news-service-da87e-default-rtdb.firebaseio.com/news.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);

      List<News> newsList = jsonMap.entries.map((entry) {
        return News.fromJson(entry.key, entry.value);
      }).toList();

      print(response.body);

      return newsList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return [];
  }
}
