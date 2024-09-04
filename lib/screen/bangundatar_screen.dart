import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:calculatorapp_redux/redux/actions.dart';
import 'package:calculatorapp_redux/redux/appState.dart';

class BangundatarScreen extends StatelessWidget {
  const BangundatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bangun Datar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose a Shape',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ShapeCard(
                    title: 'Square',
                    icon: Icons.square,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShapeCalculator(shape: 'square')),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ShapeCard(
                    title: 'Triangle',
                    icon: Icons.change_history,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShapeCalculator(shape: 'triangle')),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ShapeCard(
                    title: 'Circle',
                    icon: Icons.circle,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShapeCalculator(shape: 'circle')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShapeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ShapeCard({super.key, 
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }
}

class ShapeCalculator extends StatelessWidget {
  final String shape;
  const ShapeCalculator({super.key, required this.shape});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$shape Area Calculator'),
      ),
      body: StoreConnector<AppState, void Function(double, [double?])>(
        converter: (store) {
          return (double dimension1, [double? dimension2]) =>
              store.dispatch(CalculateShapeArea(dimension1, dimension2 ?? 0, shape));
        },
        builder: (context, callback) {
          TextEditingController controller1 = TextEditingController();
          TextEditingController controller2 = TextEditingController();

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
                        if (shape == 'triangle' || shape == 'rectangle') ...[
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
                        ] else if (shape == 'square' || shape == 'circle') ...[
                          TextField(
                            controller: controller1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: shape == 'square' ? 'Side' : 'Radius'),
                          ),
                        ],
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            final dimension1 = double.tryParse(controller1.text) ?? 0;
                            final dimension2 = shape == 'triangle' || shape == 'rectangle' ? double.tryParse(controller2.text) : null;
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
