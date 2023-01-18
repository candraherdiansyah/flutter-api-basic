import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  static Future<ArticleModel> fetchArtikelData() async {
    final response = await http.get(
        Uri.parse('http://676d-180-244-139-2.ngrok.io/api/v1/article'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var data = response.body;
      return ArticleModel.fromJson(jsonDecode(data));
    } else {
      throw Exception();
    }
  }
}

class ArticleDetailService {
  static Future<ArticleModel> fetchArtikelDetailData(String id) async {
    final response = await http.get(
        Uri.parse('http://676d-180-244-139-2.ngrok.io/api/v1/article/$id'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var data = response.body;
      return ArticleModel.fromJson(jsonDecode(data));
    } else {
      throw Exception();
    }
  }
}
