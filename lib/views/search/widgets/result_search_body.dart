import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/app_cubit/app_states.dart';
import 'package:news_app/views/home/widgets/category_news_list_item.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/views/home/widgets/category_news_list_tem_placeholder.dart';
import 'package:news_app/views/search/widgets/no_result_search.dart';
import 'package:news_app/views/search/widgets/result_search_error.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 14 / 375,
        MediaQuery.of(context).size.height * 10 / 812,
        MediaQuery.of(context).size.width * 14 / 375,
        0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Result for ",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 92, 84, 84),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 5 / 812,
          ),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              AppCubit cubit = AppCubit.getCubit(context);

              if (state is GetSearchNewsLoadingState) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const CategoryNewsListItemPlaceholder();
                    },
                  ),
                );
              } else if (state is GetSearchNewsFailureState) {
                return ResultSearchError(error: state.error);
              }

              if (cubit.searchList.isEmpty) {
                return NoResult(name: name);
              } else {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.searchList.length,
                    itemBuilder: (context, index) {
                      return CategoryNewsListItem(
                        newsModel: cubit.searchList[index],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
