import '../reducer/bmi_reducer.dart';
import 'bmi_state.dart';

class AppState {
  final BMIState bmiState;

  AppState({required this.bmiState});

  factory AppState.initial() {
    return AppState(bmiState: BMIState.initial());
  }
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    bmiState: bmiReducer(state.bmiState, action),
  );
}