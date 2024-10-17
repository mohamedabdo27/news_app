import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/container1_state.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

class HorizontalListViewCubit extends Cubit<HorizontalListViewState> {
  HorizontalListViewCubit({required this.newsServices})
      : super(InitialHorizontalListViewState());

  final NewsServices newsServices;
  static HorizontalListViewCubit getCubit(context) => BlocProvider.of(context);

  List<NewsModel> topNewsList = [];
  void getTopNews() {
    emit(LoadingTopNewsState());
    topNewsList = [];
    newsServices.getCategoryNews("top").then((value) {
      topNewsList = value;
      emit(
        GetTopNewsSuccessState(),
      );
    }).catchError((onError) {
      debugPrint("error  : ${onError.toString()}");

      emit(GetTopNewsFalureState(error: onError));
    });
  }
}
