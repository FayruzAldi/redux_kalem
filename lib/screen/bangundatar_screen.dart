import 'package:calculatorapp_redux/bangundatar_component.dart/circle_calculator.dart';
import 'package:calculatorapp_redux/bangundatar_component.dart/square_calculator.dart';
import 'package:calculatorapp_redux/bangundatar_component.dart/triangle_calculator.dart';
import 'package:flutter/material.dart';


class BangundatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bangun Datar Calculator'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildShapeCard(
              context,
              icon: Icons.circle,
              label: 'Circle Calculator',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CircleCalculator()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildShapeCard(
              context,
              icon: Icons.crop_square,
              label: 'Square Calculator',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SquareCalculator()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildShapeCard(
              context,
              icon: Icons.change_history,
              label: 'Triangle Calculator',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TriangleCalculator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeCard(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blueGrey,
              ),
              SizedBox(width: 20),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
