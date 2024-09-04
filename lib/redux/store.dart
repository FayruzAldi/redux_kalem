import 'package:redux/redux.dart';
import 'reducers.dart';
import 'appState.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState(),
);
