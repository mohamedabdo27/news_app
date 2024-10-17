import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widget/no_result_search.dart';
import 'package:news_app/Widget/result_search_body.dart';
import 'package:news_app/cubits/app_cubit/app_states.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.getCubit(context);
        Widget body = const ResultLoading();

        if (state is GetSearchNewsFailureState) {
          body = ResultError(error: state.error);
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

class ResultLoading extends StatelessWidget {
  const ResultLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ResultError extends StatelessWidget {
  const ResultError({
    super.key,
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
