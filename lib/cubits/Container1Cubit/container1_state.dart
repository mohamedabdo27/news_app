class Container1State {}

class InitialContainer1State extends Container1State {}

class LoadingTopNewsState extends Container1State {}

class GetTopNewsState extends Container1State {}

class GetTopNewsFalureState extends Container1State {
  GetTopNewsFalureState({
    required this.error,
  });
  final String error;
}
