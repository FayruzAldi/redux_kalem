import 'package:flutter_test/flutter_test.dart';
import 'package:homepage/reducer/bmi_reducer.dart';
import 'package:homepage/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:homepage/main.dart';

void main() {
  testWidgets('BMI Calculator initial state test', (WidgetTester tester) async {
    // Initialize the store
    final store = Store<AppState>(
      bmiReducer as Reducer<AppState>,
      initialState: AppState.initial(),
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(store: store));

    // Verify that the initial height and weight are 0.
    expect(find.text('Height (cm)'), findsOneWidget);
    expect(find.text('Weight (kg)'), findsOneWidget);
    expect(find.text('BMI: 0.00'), findsOneWidget);
  });
}