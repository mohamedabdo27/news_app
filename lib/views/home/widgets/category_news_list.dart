import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/home/widgets/category_news_list_item.dart';
import 'package:news_app/cubits/category_news_cubit/category_news_cubit.dart';

class CategoryNewsList extends StatelessWidget {
  const CategoryNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
      builder: (context, state) {
        CategoryNewsCubit cubit = CategoryNewsCubit.getCubit(context);
        if (state is GetCategoryNewsFailureState) {
          return Center(child: Text(state.error!));
        }
        if (state is GetCategoryNewsLoadingState) {
          return const Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: cubit.newsList.length,
          itemBuilder: (ctx, index) => CategoryNewsListItem(
            newsModel: cubit.newsList[index],
          ),
        );
      },
    );
  }
}
