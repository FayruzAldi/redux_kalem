import 'package:flutter/material.dart';

class GeometryCalculatorPage extends StatelessWidget {
  const GeometryCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Bangun Datar'),
      ),
      body: const Center(
        child: Text('This is the Geometry Calculator Page'),
      ),
    );
  }
}