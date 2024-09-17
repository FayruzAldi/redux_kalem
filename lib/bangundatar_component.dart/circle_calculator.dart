import 'package:calculatorapp_redux/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class CircleCalculator extends StatefulWidget {
  @override
  _CircleCalculatorState createState() => _CircleCalculatorState();
}

class _CircleCalculatorState extends State<CircleCalculator> {
  final TextEditingController radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Area Calculator'),
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
                  controller: radiusController,
                  labelText: 'Radius',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                StoreConnector<AppState, void Function(double)>(
                  converter: (store) {
                    return (radius) => store.dispatch(CalculateShapeArea(radius, 0, 'circle'));
                  },
                  builder: (context, callback) {
                    return buildElevatedButton(
                      onPressed: () {
                        final radius = double.tryParse(radiusController.text) ?? 0;
                        callback(radius);
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
