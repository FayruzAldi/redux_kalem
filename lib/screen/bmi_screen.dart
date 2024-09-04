import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class BMIScreen extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: StoreConnector<AppState, void Function(double, double)>(
        converter: (store) {
          return (height, weight) => store.dispatch(CalculateBMI(height, weight));
        },
        builder: (context, callback) {
          return Column(
            children: [
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Height (m)'),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
              ),
              ElevatedButton(
                onPressed: () {
                  final height = double.parse(heightController.text);
                  final weight = double.parse(weightController.text);
                  callback(height, weight);
                },
                child: Text('Calculate BMI'),
              ),
              StoreConnector<AppState, double>(
                converter: (store) => store.state.bmiResult,
                builder: (context, result) {
                  return Text('BMI: ${result}');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}