import 'package:calculatorapp_redux/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class TriangleCalculator extends StatefulWidget {
  @override
  _TriangleCalculatorState createState() => _TriangleCalculatorState();
}

class _TriangleCalculatorState extends State<TriangleCalculator> {
  final TextEditingController baseController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangle Area Calculator'),
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
                  controller: baseController,
                  labelText: 'Base',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                buildCustomTextField(
                  controller: heightController,
                  labelText: 'Height',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                StoreConnector<AppState, void Function(double, double)>(
                  converter: (store) {
                    return (base, height) => store.dispatch(CalculateShapeArea(base, height, 'triangle'));
                  },
                  builder: (context, callback) {
                    return buildElevatedButton(
                      onPressed: () {
                        final base = double.tryParse(baseController.text) ?? 0;
                        final height = double.tryParse(heightController.text) ?? 0;
                        callback(base, height);
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
