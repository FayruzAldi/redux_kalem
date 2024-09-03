import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:homepage/state/geometry_state.dart';
import 'package:homepage/actions/geometry_actions.dart';

class SegitigaPage extends StatelessWidget {
  const SegitigaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightController = TextEditingController();
    final baseController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Luas Segitiga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: baseController,
              decoration: const InputDecoration(labelText: 'Alas'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits
              ],
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Tinggi'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits
              ],
            ),
            const SizedBox(height: 16),
            StoreConnector<GeometryState, VoidCallback>(
              converter: (Store<GeometryState> store) {
                return () {
                  final base = double.parse(baseController.text);
                  final height = double.parse(heightController.text);
                  final area = 0.5 * base * height;
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
                return Text('Luas Segitiga: $area');
              },
            ),
          ],
        ),
      ),
    );
  }
}
