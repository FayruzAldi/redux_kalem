import '../state/bmi_state.dart';
import '../actions/bmi_actions.dart';

BMIState bmiReducer(BMIState state, dynamic action) {
  if (action is UpdateHeight) {
    return BMIState(height: action.height, weight: state.weight, bmi: state.bmi);
  } else if (action is UpdateWeight) {
    return BMIState(height: state.height, weight: action.weight, bmi: state.bmi);
  } else if (action is CalculateBMI) {
    final bmi = state.weight / ((state.height / 100) * (state.height / 100));
    return BMIState(height: state.height, weight: state.weight, bmi: bmi);
  }
  return state;
}