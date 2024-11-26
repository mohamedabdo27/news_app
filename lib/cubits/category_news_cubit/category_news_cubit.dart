import 'package:flutter_bloc/flutter_bloc.dart';
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
  }

  List<NewsModel> newsList = [];
  void getCategoryNews({required String catName}) async {
    emit(GetCategoryNewsLoadingState());

    newsList = [];
    var result = await newsServices.getCategoryNews(catName);
    result.fold((failure) {
      emit(
        GetCategoryNewsFailureState(
          error: failure.error,
        ),
      );
    }, (newsListResponse) {
      newsList = newsListResponse;
      emit(GetCategoryNewsSuccessState());
    });
  }
}
