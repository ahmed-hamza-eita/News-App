import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/news_service.dart';
import 'news_sliver_list.dart';

class NewsSliverListBuilder extends StatefulWidget {
  const NewsSliverListBuilder({
    super.key,
  });

  @override
  State<NewsSliverListBuilder> createState() => _NewsSliverListBuilderState();
}

class _NewsSliverListBuilderState extends State<NewsSliverListBuilder> {
  bool isLoading = true;
  List<ArticleModel> articles = [];
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
        : NewsSliverList(
            articles: articles,
          );
  }
}
