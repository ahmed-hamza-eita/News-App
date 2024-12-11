import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home_page.dart';

void main() {
  getNews();
  runApp(const NewsApp());
}

final dio = Dio();
void getNews() async {
  final response = await dio.get(
      "https://newsapi.org/v2/everything?q=keyword&apiKey=5619cce537c7439cb56deb903366b2a8");

  print(response);
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
