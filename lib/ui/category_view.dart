import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_sliver_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
final String category;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [NewsSliverListBuilder(category: category)],
        ),
      ),
    );
  }
}
