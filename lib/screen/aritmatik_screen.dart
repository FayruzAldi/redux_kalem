import 'package:calculatorapp_redux/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class Aritmatikscreen extends StatefulWidget {
  @override
  _AritmatikScreenState createState() => _AritmatikScreenState();
}

class _AritmatikScreenState extends State<Aritmatikscreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String? selectedOperation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Calculator'),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildCustomTextField(
                  controller: num1Controller,
                  labelText: 'Number 1',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                buildCustomTextField(
                  controller: num2Controller,
                  labelText: 'Number 2',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                _buildHorizontalOperationSelector(),
                SizedBox(height: 20),
                StoreConnector<AppState, void Function(double, double, String)>(
                  converter: (store) {
                    return (num1, num2, operation) =>
                        store.dispatch(CalculateArithmetic(num1, num2, operation));
                  },
                  builder: (context, callback) {
                    return buildElevatedButton(
                      onPressed: () {
                        final num1 = double.tryParse(num1Controller.text);
                        final num2 = double.tryParse(num2Controller.text);

                        if (num1 != null && num2 != null && selectedOperation != null) {
                          callback(num1, num2, selectedOperation!);
                          _showResultDialog(context);
                        } else {
                          _showErrorDialog(context);
                        }
                      },
                      label: 'Calculate',
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

  Widget _buildHorizontalOperationSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildOperationRadio('+'),
        _buildOperationRadio('-'),
        _buildOperationRadio('*'),
        _buildOperationRadio('/'),
      ],
    );
  }

  Widget _buildOperationRadio(String operation) {
    return Row(
      children: [
        Radio<String>(
          value: operation,
          groupValue: selectedOperation,
          onChanged: (value) {
            setState(() {
              selectedOperation = value;
            });
          },
        ),
        Text(operation),
      ],
    );
  }

  void _showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StoreConnector<AppState, String>(
          converter: (store) => store.state.arithmeticResult.toString(),
          builder: (context, result) {
            return AlertDialog(
              title: Text('Result'),
              content: Text(result),
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
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please fill in all fields.'),
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
}
