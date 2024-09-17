import 'package:calculatorapp_redux/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class BangundatarScreen extends StatelessWidget {
  final TextEditingController dimension1Controller = TextEditingController();
  final TextEditingController dimension2Controller = TextEditingController();
  final TextEditingController shapeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bangun Datar Calculator'),
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
                  controller: dimension1Controller,
                  labelText: 'Dimension 1',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                buildCustomTextField(
                  controller: dimension2Controller,
                  labelText: 'Dimension 2',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                buildCustomTextField(
                  controller: shapeController,
                  labelText: 'Shape (square/triangle/circle)',
                ),
                SizedBox(height: 20),
                StoreConnector<AppState, void Function(double, double, String)>(
                  converter: (store) {
                    return (dimension1, dimension2, shape) =>
                        store.dispatch(CalculateShapeArea(dimension1, dimension2, shape));
                  },
                  builder: (context, callback) {
                    return buildElevatedButton(
                      onPressed: () {
                        final dimension1 = double.tryParse(dimension1Controller.text);
                        final dimension2 = double.tryParse(dimension2Controller.text);
                        final shape = shapeController.text.toLowerCase();

                        if (dimension1 != null && dimension2 != null && shape.isNotEmpty) {
                          callback(dimension1, dimension2, shape);
                          _showResultDialog(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter valid dimensions and shape.')),
                          );
                        }
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
              content: Text('Area is $result'),
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
