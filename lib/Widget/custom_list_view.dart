import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/list_view_item.dart';
import 'package:news_app/cubits/category_news_cubit/category_news_cubit.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
      builder: (context, state) {
        log("CustomListView");
        CategoryNewsCubit cubit = CategoryNewsCubit.getCubit(context);
        if (state is GetCategoryNewsFailureState) {
          return Center(child: Text(state.error!));
        }
        if (state is GetCategoryNewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: cubit.newsList.length,
          itemBuilder: (ctx, index) => ListViewItem(
            container1Model: cubit.newsList[index],
          ),
        );
      },
    );
  }
}
