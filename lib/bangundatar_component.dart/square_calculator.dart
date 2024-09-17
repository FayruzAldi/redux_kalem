import 'package:calculatorapp_redux/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class SquareCalculator extends StatefulWidget {
  @override
  _SquareCalculatorState createState() => _SquareCalculatorState();
}

class _SquareCalculatorState extends State<SquareCalculator> {
  final TextEditingController sideController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Square Area Calculator'),
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
                  controller: sideController,
                  labelText: 'Side',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                StoreConnector<AppState, void Function(double)>(
                  converter: (store) {
                    return (side) => store.dispatch(CalculateShapeArea(side, 0, 'square'));
                  },
                  builder: (context, callback) {
                    return buildElevatedButton(
                      onPressed: () {
                        final side = double.tryParse(sideController.text) ?? 0;
                        callback(side);
                        _showResultDialog(context);
                      },
                      label: 'Calculate Area',
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

  void _showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StoreConnector<AppState, String>(
          converter: (store) => store.state.shapeAreaResult.toString(),
          builder: (context, result) {
            return AlertDialog(
              title: Text('Result'),
              content: Text('Area: $result'),
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
}
