import 'package:flutter/material.dart';
import 'package:news_app/Widget/category.dart';
import 'package:news_app/models/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});
  final List<CategoryModel> categoryList = const [
    CategoryModel(name: "top"),
    CategoryModel(name: "business"),
    CategoryModel(name: "health"),
    CategoryModel(name: "crime"),
    CategoryModel(name: "education"),
    CategoryModel(name: "domestic"),
    CategoryModel(name: "environment"),
    CategoryModel(name: "food"),
    CategoryModel(name: "other"),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final category in categoryList)
            Category(
              index: categoryList.indexOf(category),
              category: category,
            ),
        ],
      ),
    );
  }
}
