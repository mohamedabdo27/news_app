import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/shared_preverences.dart';
import 'package:news_app/views/home/widgets/favorite_screen.dart';
import 'package:news_app/views/home/widgets/home_view_body.dart';
import 'package:news_app/views/home/widgets/profile_screen.dart';
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
  List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "Favorite",
      icon: Icon(
        Icons.favorite,
      ),
    ),
    BottomNavigationBarItem(
      label: "Profile",
      icon: Icon(
        Icons.person,
      ),
    )
  ];
  int currentIndex = 0;
  List<String> appBarTitle = [
    "Home Page",
    " Favorite Page",
    "Profile Page",
  ];
  List<Widget> screens = const [
    HomeViewBody(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeButtonNavBarState());
  }

//========================================================================

////============================================================================
  List<NewsModel> searchList = [];
  void getSearchNews({
    required String searchKey,
  }) async {
    emit(GetSearchNewsLoadingState());
    final result = await newsServices.getSearchNews(searchKey);
    result.fold(
      (failure) {
        emit(GetSearchNewsFailureState(error: failure.error));
      },
      (searchListResponse) {
        searchList = searchListResponse;
        emit(GetSearchNewsSuccessState());
      },
    );
  }
}
