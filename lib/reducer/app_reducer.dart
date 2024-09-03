import '../actions/app_actions.dart';
import '../state/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementAction) {
    return AppState(counter: state.counter + 1);
  }
  return state;
}