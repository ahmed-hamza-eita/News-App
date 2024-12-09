import 'package:flutter/material.dart';

import 'news_item.dart';

class NewsSliverList extends StatelessWidget {
  const NewsSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NewsItem();
        },
        childCount: 10,
      ),
    );
  }
}
