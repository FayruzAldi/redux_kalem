import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'reducer/bmi_reducer.dart';
import 'state/app_state.dart';
import 'home_page.dart';
import 'bmi_calculator_page.dart';
import 'arithmetic_calculator_page.dart';
import 'geometry_calculator_page.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [NavigationMiddleware<AppState>()],
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: NavigatorHolder.navigatorKey,
        routes: {
          '/': (context) => const HomePage(title: 'Home Page'),
          '/bmi_calculator': (context) => BMICalculatorPage(),
          '/arithmetic_calculator': (context) => ArithmeticCalculatorPage(),
          '/geometry_calculator': (context) => GeometryCalculatorPage(),
        },
      ),
    );
  }
}