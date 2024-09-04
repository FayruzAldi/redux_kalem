import 'package:calculatorapp_redux/screen/bangundatar_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculatorapp_redux/screen/aritmatik_screen.dart';
import 'package:calculatorapp_redux/screen/bmi_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Statement'),
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
            _buildCalculatorCard(
              context,
              icon: Icons.person,
              label: 'BMI Calculator',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMIScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildCalculatorCard(
              context,
              icon: Icons.calculate,
              label: 'Arithmetic Calculator',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aritmatikscreen()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildCalculatorCard(
              context,
              icon: Icons.crop_square,
              label: 'Shape Calculator',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BangundatarScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculatorCard(
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
