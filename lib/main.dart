import 'package:calculatorapp_redux/redux/appState.dart';
import 'package:calculatorapp_redux/redux/store.dart';
import 'package:calculatorapp_redux/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux Calculator App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
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
