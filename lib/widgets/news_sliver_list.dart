import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import 'news_item.dart';

class NewsSliverList extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsSliverList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsItem(
              article: articles[index],
            ),
          );
        },
      ),
    );
  }
}
