import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/cubits/category_cubit/category_cubit.dart';
import 'package:news_app/models/category_model.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var categoryCubit = BlocProvider.of<CategoryCubit>(context);
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: categoryCubit.indexButton == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
                foregroundColor: categoryCubit.indexButton == index
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                categoryCubit.getNews(catName: category.name);
                categoryCubit.changeColor(index);
              },
              child: Text(
                category.name,
              ));
        },
      ),
    );
  }
}
