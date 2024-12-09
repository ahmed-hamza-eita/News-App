import 'package:flutter/material.dart';

import 'news_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // when use it the all items will be built at once and it will not be lazy loaded
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: NewsItem(),
          );
        });
  }
}
