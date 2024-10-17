class AppState {}

class InitialAppState extends AppState {}

class GetSearchNewsLoadingState extends AppState {}

class GetSearchNewsSuccessState extends AppState {}

class GetSearchNewsFailureState extends AppState {
  final String error;

  GetSearchNewsFailureState({required this.error});
}

// class GetCategoryNewsSuccessState extends AppState {}

// class GetCategoryNewsLoadingState extends AppState {}

// class GetCategoryNewsFailureState extends AppState {
//   final String? error;

//   GetCategoryNewsFailureState({required this.error});
// }

// class GetTopNewsState extends CategoryState {}

// class LoadingTopNewsState extends CategoryState {}

// class GetTopNewsFalureState extends CategoryState {
//   final String? error;

//   GetTopNewsFalureState({required this.error});
// }

class ChangeButtonState extends AppState {}

class ChangeButtonNavBarState extends AppState {}

class ChangeModeState extends AppState {}
