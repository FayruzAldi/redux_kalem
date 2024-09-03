import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:homepage/state/geometry_state.dart';
import 'package:homepage/actions/geometry_actions.dart';


class PersegiPage extends StatelessWidget {
  const PersegiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sideController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Luas Persegi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: sideController,
              decoration: const InputDecoration(labelText: 'Sisi'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 16),
            StoreConnector<GeometryState, VoidCallback>(
              converter: (Store<GeometryState> store) {
                return () {
                  final side = double.parse(sideController.text);
                  final area = side * side;
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
                return Text('Luas Persegi: $area');
              },
            ),
          ],
        ),
      ),
    );
  }
}
