import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/SharedPreferences/shared_preverences.dart';
import 'package:news_app/screens/home/homeBodies/favorite_screen.dart';
import 'package:news_app/screens/home/homeBodies/home_screen.dart';
import 'package:news_app/screens/home/homeBodies/profile_screen.dart';
import 'package:news_app/cubits/app_cubit/app_states.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.newsServices}) : super(InitialAppState());
  NewsServices newsServices;
  static AppCubit getCubit(context) => BlocProvider.of(context);
//==================================================================

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

  // int indexButton = 2;
  // void changeColor(int index) {
  //   indexButton = index;
  //   emit(ChangeButtonState());
  // }

////============================================================================
  List<NewsModel> searchList = [];
  void getSearchNews({required String searchKey}) {
    emit(GetSearchNewsLoadingState());
    newsServices.getSearchNews(searchKey).then((value) {
      searchList = value;
      emit(GetSearchNewsSuccessState());
    }).catchError((onError) {
      emit(GetSearchNewsFailureState(error: onError));
    });
  }
}
