import 'package:calculatorapp_redux/screen/aritmatik_screen.dart';
import 'package:calculatorapp_redux/screen/bangundatar_screen.dart';
import 'package:calculatorapp_redux/screen/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Application Project'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmiScreen()),
              );
            },
            child: Text('BMI Calculator'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AritmatikScreen()),
              );
            },
            child: Text('Arithmetic Calculator'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BangundatarScreen()),
              );
            },
            child: Text('Shape Calculator'),
          ),
        ],
      ),
    );
  }
}
