import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_sliver_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              NewsSliverList()
            ],
          ),
        )
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Column(
        //     children: [
        //       CategoriesListView(),
        //       SizedBox(height: 16),
        //       Expanded(
        //         child: NewsListView(),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
