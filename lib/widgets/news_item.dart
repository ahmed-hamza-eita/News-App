import 'package:flutter/material.dart';

import '../models/article_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              article.image!.isNotEmpty ? article.image! : "",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        const SizedBox(height: 12),
        Text(
          article.title,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.subTitle!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
