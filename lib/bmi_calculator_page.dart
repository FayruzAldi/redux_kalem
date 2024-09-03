import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'actions/bmi_actions.dart';
import 'state/app_state.dart';

class BMICalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    StoreConnector<AppState, double>(
                      converter: (store) => store.state.bmiState.height,
                      builder: (context, height) {
                        return TextField(
                          decoration: const InputDecoration(labelText: 'Height (cm)'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(UpdateHeight(double.parse(value)));
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    StoreConnector<AppState, double>(
                      converter: (store) => store.state.bmiState.weight,
                      builder: (context, weight) {
                        return TextField(
                          decoration: const InputDecoration(labelText: 'Weight (kg)'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(UpdateWeight(double.parse(value)));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            StoreConnector<AppState, double>(
              converter: (store) => store.state.bmiState.bmi,
              builder: (context, bmi) {
                return Text(
                  'BMI: ${bmi.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(CalculateBMI());
              },
              child: const Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}