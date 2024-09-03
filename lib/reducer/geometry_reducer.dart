import 'package:homepage/state/geometry_state.dart';
import 'package:homepage/actions/geometry_actions.dart';

GeometryState appReducer(GeometryState state, dynamic action) {
  if (action is CalculateAreaAction) {
    return GeometryState(area: action.area);
  }
  return state;
}