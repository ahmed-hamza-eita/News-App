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
    articles = await NewsService(Dio()).getGeneralNews();
    isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SliverList(
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
