class AppState {
  final int counter;

  AppState({required this.counter});

  factory AppState.initial() {
    return AppState(counter: 0);
  }
}