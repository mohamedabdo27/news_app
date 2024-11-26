import 'package:flutter/material.dart';
import 'package:news_app/views/home/widgets/category_buttons_list_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoryButtonsList extends StatelessWidget {
  const CategoryButtonsList({super.key});

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
            CategoryButtonsListItem(
              index: categoryList.indexOf(category),
              category: category,
            ),
        ],
      ),
    );
  }
}
