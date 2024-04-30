import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/Container1Cubit/container1_state.dart';
import 'package:news_app/models/custom_container1.dart';
import 'package:news_app/services/news_service.dart';

class Container1Cubit extends Cubit<Container1State> {
  Container1Cubit() : super(InitialContainer1State());
  static Container1Cubit getCubit(context) => BlocProvider.of(context);

  List<Container1Model> topNewsList = [];
  void getTopNews() {
    emit(LoadingTopNewsState());
    topNewsList = [];
    NewsServices(Dio()).getTopNews().then((value) {
      topNewsList = value;
      emit(
        GetTopNewsState(),
      );
    }).catchError((onError) {
      emit(GetTopNewsFalureState(error: onError));
      print(onError.toString());
    });
  }
}
