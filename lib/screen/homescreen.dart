import 'package:calculatorapp_redux/screen/aritmatik_screen.dart';
import 'package:calculatorapp_redux/screen/bangundatar_screen.dart';
import 'package:calculatorapp_redux/screen/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Application Project'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiScreen()),
              );
            },
            child: const Text('BMI Calculator'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AritmatikScreen()),
              );
            },
            child: const Text('Arithmetic Calculator'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BangundatarScreen()),
              );
            },
            child: const Text('Shape Calculator'),
          ),
        ],
      ),
    );
  }
}
