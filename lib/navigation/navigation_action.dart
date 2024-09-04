import 'package:calculatorapp_redux/redux/appState.dart';
import 'package:redux/redux.dart';

class NavigateToBMI {}

class NavigateToArithmetic {}

class NavigateToGeometry {}

void navigateToBMI(Store<AppState> store) {
  store.dispatch(NavigateToBMI());
}

void navigateToArithmetic(Store<AppState> store) {
  store.dispatch(NavigateToArithmetic());
}

void navigateToGeometry(Store<AppState> store) {
  store.dispatch(NavigateToGeometry());
}
