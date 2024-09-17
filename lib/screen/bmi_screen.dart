import 'package:calculatorapp_redux/component/component.dart';
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shadowColor: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                buildCustomTextField(
                  controller: heightController,
                  labelText: 'Height (cm)',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                buildCustomTextField(
                  controller: weightController,
                  labelText: 'Weight (kg)',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                StoreConnector<AppState, void Function(double, double)>(
                  converter: (store) {
                    return (height, weight) => store.dispatch(CalculateBMI(height, weight));
                  },
                  builder: (context, callback) {
                    return buildElevatedButton(
                      onPressed: () {
                        final heightCm = double.tryParse(heightController.text);
                        final weight = double.tryParse(weightController.text);

                        if (heightCm != null && weight != null) {
                          final heightM = heightCm / 100; // Convert cm to meters
                          callback(heightM, weight);
                          _showBMIResult(context, heightM, weight);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter valid height and weight.')),
                          );
                        }
                      },
                      label: 'Calculate BMI',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBMIResult(BuildContext context, double height, double weight) {
    final bmi = weight / (height * height);
    final classification = _getClassification(bmi);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BMI Result'),
          content: Text(
            'Your BMI is ${bmi.toStringAsFixed(2)}.\nClassification: $classification',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String _getClassification(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
