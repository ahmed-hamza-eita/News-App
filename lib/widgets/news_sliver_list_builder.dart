import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/progress_loading.dart';

import '../services/news_service.dart';
import 'news_sliver_list.dart';

class NewsSliverListBuilder extends StatefulWidget {
  const NewsSliverListBuilder({
    super.key,
    required this.category,
  });

  final String category;
  @override
  State<NewsSliverListBuilder> createState() => _NewsSliverListBuilderState();
}

class _NewsSliverListBuilderState extends State<NewsSliverListBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService((Dio())).getGeneralNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsSliverList(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('oops! something went wrong'),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: ProgressLoading()),
            );
          }
        });

    // return isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       )
    //     : articles.isNotEmpty
    //         ? NewsSliverList(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //             child: Center(
    //               child: Text('oops! something went wrong'),
    //             ),
    //           );
  }
}
