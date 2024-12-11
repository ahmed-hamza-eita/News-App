import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../services/news_service.dart';
import 'news_item.dart';

class NewsSliverList extends StatefulWidget {
  const NewsSliverList({
    super.key,
  });

  @override
  State<NewsSliverList> createState() => _NewsSliverListState();
}

class _NewsSliverListState extends State<NewsSliverList> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  initState() {
    super.initState();
    getGeneralNew();
  }

  Future<void> getGeneralNew() async {
    try {
      articles = await NewsService(Dio()).getGeneralNews();
      if (articles.isEmpty) {
        print('No articles found');
      } else {
        print('Articles fetched successfully');
      }
    } catch (e) {
      print('Error fetching articles: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
            (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: NewsItem(
              article: articles[index],
            ),
          );
        },
      ),
    );
  }
}