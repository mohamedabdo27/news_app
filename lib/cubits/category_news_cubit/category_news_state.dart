part of 'category_news_cubit.dart';

@immutable
abstract class CategoryNewsState {}

final class CategoryNewsInitialState extends CategoryNewsState {}

class GetCategoryNewsSuccessState extends CategoryNewsState {}

class GetCategoryNewsLoadingState extends CategoryNewsState {}

class GetCategoryNewsFailureState extends CategoryNewsState {
  final String? error;

  GetCategoryNewsFailureState({required this.error});
}

class ChangeButtonState extends CategoryNewsState {}
