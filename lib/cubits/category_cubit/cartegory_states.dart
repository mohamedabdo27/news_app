class CategoryState {}

class InitialState extends CategoryState {}

class GetCategoryNewsState extends CategoryState {}

class LoadingSearchNewsState extends CategoryState {}

class GetSearchNewsSuccessState extends CategoryState {}

class GetSearchNewsFalureState extends CategoryState {
  final String error;

  GetSearchNewsFalureState({required this.error});
}

class LoadingCategoryNewsState extends CategoryState {}

class GetCategoryNewsFalureState extends CategoryState {
  final String? error;

  GetCategoryNewsFalureState({required this.error});
}

// class GetTopNewsState extends CategoryState {}

// class LoadingTopNewsState extends CategoryState {}

// class GetTopNewsFalureState extends CategoryState {
//   final String? error;

//   GetTopNewsFalureState({required this.error});
// }

class ChangeButtonState extends CategoryState {}

class ChangeButtonNavBarState extends CategoryState {}

class ChangeModeState extends CategoryState {}

class ChangeFavorie extends CategoryState {}
