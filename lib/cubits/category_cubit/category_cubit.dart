import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/SharedPreferences/shared_preverences.dart';
import 'package:news_app/Widget/homeBodies/favorite_screen.dart';
import 'package:news_app/Widget/homeBodies/home_screen.dart';
import 'package:news_app/Widget/homeBodies/profile_screen.dart';
import 'package:news_app/cubits/category_cubit/cartegory_states.dart';
import 'package:news_app/models/custom_container1.dart';
import 'package:news_app/services/news_service.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(InitialState());

  static CategoryCubit getCubit(context) => BlocProvider.of(context);
//==================================================================
  Map<String, bool> favorite = {};
  // changeFavorite(String id) {
  //   favorite[id] = !favorite[id]!;

  //   emit(ChangeFavorie());
  // }

//------------------------------------------------------------------

  bool isDark = false;
  changeMode({bool? isDarkMode}) {
    if (isDarkMode != null) {
      isDark = isDarkMode;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CachedData.putData("isDark", isDark).then(
        (value) => emit(
          ChangeModeState(),
        ),
      );
    }
  }

//===================================================================
  int currentIndex = 0;
  List<String> appBarTitle = [
    "Home Page",
    " Favorite Page",
    "Profile Page",
  ];
  List<Widget> screens = const [
    HomeBody(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeButtonNavBarState());
  }

//========================================================================
  int indexButton = 2;
  void changeColor(int index) {
    indexButton = index;
    emit(ChangeButtonState());
  }

////============================================================================

  List<Container1Model> container1List = [];
  void getNews({required String catName}) {
    emit(LoadingCategoryNewsState());
    container1List = [];
    NewsServices(Dio()).getCategoryNews(catName).then((value) {
      container1List = value;
      //   log(container1List[1].id);
      container1List.forEach((element) {
        favorite.addAll({
          element.articleId: false,
        });
        // log(element.id);
      });
      //  log(favorite.toString());
      emit(
        GetCategoryNewsState(),
      );
    }).catchError((onError) {
      emit(GetCategoryNewsFalureState(error: onError));
      log(onError.toString());
    });
  }

  List<Container1Model> searchList = [];
  void getSearchNews({required String searchKey}) {
    emit(LoadingSearchNewsState());

    NewsServices(Dio()).getSearchNews(searchKey).then((value) {
      searchList = value;
      emit(GetSearchNewsSuccessState());
    }).catchError((onError) {
      emit(GetSearchNewsFalureState(error: onError));
    });
  }
  // List<Container1Model> topNewsList = [];
  // void getTopNews() {
  //   emit(LoadingTopNewsState());
  //   topNewsList = [];
  //   NewsServices(Dio()).getTopNews().then((value) {
  //     topNewsList = value;
  //     emit(
  //       GetTopNewsState(),
  //     );
  //   }).catchError((onError) {
  //     emit(GetTopNewsFalureState(error: onError));
  //     print(onError.toString());
  //   });
  // }
}
