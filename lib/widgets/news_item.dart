import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  //final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            "https://plus.unsplash.com/premium_photo-1688561384438-bfa9273e2c00?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Manslaughter charge dismissed in Daniel Penny trial, jury to consider homicide charge Manslaughter charge dismissed in Daniel Penny trial, jury to consider homicide charge",
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
          "Manslaughter charge dismissed in Daniel Penny trial, jury to consider homicide charge Manslaughter charge dismissed in Daniel Penny trial, jury to consider homicide charge ",
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
