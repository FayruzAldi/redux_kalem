import 'package:flutter/material.dart';

class BmiCalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
      ),
      body: Center(
        child: Text('This is the BMI Calculator Page'),
      ),
    );
  }
}