import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/horizontal_list_view_Cubit/horizontal_list_view_state.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

class HorizontalListViewCubit extends Cubit<HorizontalListViewState> {
  HorizontalListViewCubit({required this.newsServices})
      : super(InitialHorizontalListViewState());

  final NewsServices newsServices;
  static HorizontalListViewCubit getCubit(context) => BlocProvider.of(context);

  List<NewsModel> topNewsList = [];
  void getTopNews() async {
    emit(LoadingTopNewsState());
    topNewsList = [];
    final result = await newsServices.getCategoryNews("top");
    result.fold((failure) {
      emit(GetTopNewsFalureState(error: failure.error));
    }, (topNewsListResponse) {
      topNewsList = topNewsListResponse;
      emit(
        GetTopNewsSuccessState(),
      );
    });
  }
}
