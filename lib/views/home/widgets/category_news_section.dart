import 'package:flutter/material.dart';
import 'package:news_app/views/home/widgets/category_buttons_list.dart';
import 'package:news_app/views/home/widgets/category_news_list.dart';

class CategoryNewsSection extends StatelessWidget {
  const CategoryNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryButtonsList(),
        SizedBox(height: MediaQuery.of(context).size.height * 16 / 812),
        const CategoryNewsList(),
      ],
    );
  }
}
