import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getGeneralNews() async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apikey=5619cce537c7439cb56deb903366b2a8&country=us&category=general');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'] ?? '',
          title: article['title'] ?? 'No title',
          subTitle: article['description'] ?? 'No description',
        );
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }
}
