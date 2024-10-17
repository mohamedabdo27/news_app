import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

part 'category_news_state.dart';

class CategoryNewsCubit extends Cubit<CategoryNewsState> {
  CategoryNewsCubit({required this.newsServices})
      : super(CategoryNewsInitialState());
  NewsServices newsServices;
  static CategoryNewsCubit getCubit(context) => BlocProvider.of(context);

  int indexButton = 2;
  void changeColor(int index) {
    indexButton = index;
    // emit(ChangeButtonState());
  }

  List<NewsModel> newsList = [];
  void getCategoryNews({required String catName}) {
    emit(GetCategoryNewsLoadingState());

    newsList = [];
    newsServices.getCategoryNews(catName).then((value) {
      newsList = value;

      emit(GetCategoryNewsSuccessState());
    }).catchError((onError) {
      emit(GetCategoryNewsFailureState(error: onError));
      log(onError.toString());
    });
  }
}
