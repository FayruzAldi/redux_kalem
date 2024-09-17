import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class ShapeCalculator extends StatefulWidget {
  final String shape;
  
  const ShapeCalculator({super.key, required this.shape});

  @override
  _ShapeCalculatorState createState() => _ShapeCalculatorState();
}

class _ShapeCalculatorState extends State<ShapeCalculator> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.shape} Area Calculator'),
      ),
      body: StoreConnector<AppState, void Function(double, [double?])>(
        converter: (store) {
          return (dimension1, [dimension2]) =>
              store.dispatch(CalculateShapeArea(dimension1, dimension2 ?? 0, widget.shape));
        },
        builder: (context, callback) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (widget.shape == 'triangle' || widget.shape == 'rectangle') ...[
                          TextField(
                            controller: controller1,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Base'),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: controller2,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Height'),
                          ),
                        ] else if (widget.shape == 'square' || widget.shape == 'circle') ...[
                          TextField(
                            controller: controller1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: widget.shape == 'square' ? 'Side' : 'Radius'),
                          ),
                        ],
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            final dimension1 = double.tryParse(controller1.text) ?? 0;
                            final dimension2 = widget.shape == 'triangle' || widget.shape == 'rectangle' ? double.tryParse(controller2.text) : null;
                            callback(dimension1, dimension2);
                          },
                          child: const Text('Calculate Area'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, state) {
                    return Text('Area: ${state.shapeAreaResult}', style: const TextStyle(fontSize: 18));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
