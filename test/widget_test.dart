import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:kalkulator_bmi/main.dart';
import 'package:kalkulator_bmi/state/app_state.dart';
import 'package:kalkulator_bmi/reducer/bmi_reducer.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create the store
    final store = Store<AppState>(appReducer, initialState: AppState.initial());

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(store: store));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}