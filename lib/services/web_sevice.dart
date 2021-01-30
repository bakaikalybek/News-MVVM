import 'package:dio/dio.dart';
import 'package:news_mvvm/models/news_article.dart';
import 'package:news_mvvm/utils/constants.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlinesCountry(String country) async {
    final response = await dio.get(Constants.headlinesFor(country));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to load News");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await dio.get(Constants.TOP_HEADLINES_URL);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to load News");
    }
  }
}
