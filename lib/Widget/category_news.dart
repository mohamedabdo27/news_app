import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/Widget/category_list.dart';
import 'package:news_app/Widget/custom_list_view.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({super.key});

  @override
  Widget build(BuildContext context) {
    log("CategoryNews");
    return Column(
      children: [
        const CategoryList(),
        SizedBox(height: MediaQuery.of(context).size.height * 16 / 812),
        const CustomListView(),
      ],
    );
  }
}
