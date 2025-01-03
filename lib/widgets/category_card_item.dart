import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

import '../ui/category_view.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryView(
            category: categoryModel.categoryName.toLowerCase(),
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        width: 200,
        height: 110,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categoryModel.image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            categoryModel.categoryName,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
