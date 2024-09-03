import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:homepage/state/geometry_state.dart';
import 'package:homepage/actions/geometry_actions.dart';

class LingkaranPage extends StatelessWidget {
  const LingkaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Luas Lingkaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(labelText: 'Jari-Jari'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits
              ],
            ),
            const SizedBox(height: 16),
            StoreConnector<GeometryState, VoidCallback>(
              converter: (Store<GeometryState> store) {
                return () {
                  final radius = double.parse(radiusController.text);
                  final area = 3.14 * radius * radius;
                  store.dispatch(CalculateAreaAction(area));
                };
              },
              builder: (context, callback) {
                return ElevatedButton(
                  onPressed: callback,
                  child: const Text('Hitung Luas'),
                );
              },
            ),
            const SizedBox(height: 16),
            StoreConnector<GeometryState, double>(
              converter: (Store<GeometryState> store) => store.state.area,
              builder: (context, area) {
                return Text('Luas Lingkaran: $area');
              },
            ),
          ],
        ),
      ),
    );
  }
}
