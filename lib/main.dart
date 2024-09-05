import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:homepage/arithmetic_calculator_page.dart';
import 'package:redux/redux.dart';
import 'package:homepage/state/app_state.dart';
import 'homepage.dart';
import 'bmi_calculator_page.dart';
import 'geometry_calculator_page.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [const NavigationMiddleware<AppState>().call],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: NavigatorHolder.navigatorKey,
        routes: {
          '/': (context) => const HomePage(title: 'Flutter Demo Home Page'),
          '/bmi_calculator_page.dart': (context) => const BMICalculatorPage(),
          '/geometry_calculator_page.dart': (context) => const GeometryCalculatorPage(),
          '/arithmetic_calculator_page.dart': (context) => const ArithmeticCalculatorPage(),
        },
      ),
    );
  }
}