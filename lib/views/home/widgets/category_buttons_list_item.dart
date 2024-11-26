import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app/cubits/category_news_cubit/category_news_cubit.dart';
import 'package:news_app/models/category_model.dart';

class CategoryButtonsListItem extends StatelessWidget {
  const CategoryButtonsListItem({
    super.key,
    required this.category,
    required this.index,
  });
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    var categoryCubit = BlocProvider.of<CategoryNewsCubit>(context);

    return BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: categoryCubit.indexButton == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
              foregroundColor: categoryCubit.indexButton == index
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              categoryCubit.getCategoryNews(catName: category.name);
              categoryCubit.indexButton = index;
            },
            child: Text(
              category.name,
            ),
          ),
        );
      },
    );
  }
}
