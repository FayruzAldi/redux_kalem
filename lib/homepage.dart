import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:homepage/state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(NavigateToAction.push('/bmi_calculator_page.dart'));
                },
                child: const Text('BMI Calculator'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(NavigateToAction.push('/geometry_calculator_page.dart'));
                },
                child: const Text('Kalkulator Bangun Datar'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(NavigateToAction.push('/arithmetic_calculator_page.dart'));
                },
                child: const Text('Kalkulator Aritmatik'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}