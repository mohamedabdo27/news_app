class HorizontalListViewState {}

class InitialHorizontalListViewState extends HorizontalListViewState {}

class LoadingTopNewsState extends HorizontalListViewState {}

class GetTopNewsSuccessState extends HorizontalListViewState {}

class GetTopNewsFalureState extends HorizontalListViewState {
  GetTopNewsFalureState({
    required this.error,
  });
  final String error;
}
