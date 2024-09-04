import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';
import 'package:flutter/services.dart';

class Aritmatikscreen extends StatefulWidget {
  @override
  _AritmatikscreenState createState() => _AritmatikscreenState();
}

class _AritmatikscreenState extends State<Aritmatikscreen> {
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
                _buildCustomTextField(
                  controller: num1Controller,
                  labelText: 'Number 1',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                _buildCustomTextField(
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
                    return ElevatedButton(
                      onPressed: () {
                        final num1 = double.tryParse(num1Controller.text);
                        final num2 = double.tryParse(num2Controller.text);

                        if (num1 != null && num2 != null && selectedOperation != null) {
                          callback(num1, num2, selectedOperation!);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StoreConnector<AppState, String>(
                                converter: (store) => store.state.arithmeticResult.toString(),
                                builder: (context, result) {
                                  return AlertDialog(
                                    title: Text('Hasilnya'),
                                    content: Text('$result'),
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
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Invalid Input'),
                                content: Text('tolong isi yang kosong.'),
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
                      },
                      child: Text('Calculate'),
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

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      inputFormatters: inputType == TextInputType.number
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))]
          : [],
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.blueGrey),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
}
