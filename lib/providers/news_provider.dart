import 'package:flutter/material.dart';
import 'package:news_app/helpers/api.dart';
import 'package:news_app/models/top_news_model.dart';
import 'package:news_app/utils/const.dart';

class NewsProvider extends ChangeNotifier {
  bool isLoading = true;

  TopNewsModel? resNews;

  getTopNews(String category) async {
    final res = await api(
        '${baseUrl}top-headlines?country=us&category=${category}&apiKey=${apiKey}');

    if (res.statusCode == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
  }
}
