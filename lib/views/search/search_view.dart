import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/cubits/app_cubit/app_states.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/views/search/widgets/no_result_search.dart';
import 'package:news_app/views/search/widgets/result_search_body.dart';
import 'package:news_app/views/search/widgets/result_search_error.dart';
import 'package:news_app/views/search/widgets/result_search_laoding.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.getCubit(context);
        Widget body = const ResultSearchLoading();

        if (state is GetSearchNewsFailureState) {
          body = ResultSearchError(error: state.error);
        } else if (state is GetSearchNewsSuccessState) {
          if (cubit.searchList.isNotEmpty) {
            body = ResultBody(name: name, cubit: cubit);
          } else {
            body = NoResult(name: name);
          }
        }
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Result page",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          body: body,
        );
      },
    );
  }
}
