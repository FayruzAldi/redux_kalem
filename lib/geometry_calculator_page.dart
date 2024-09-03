import 'package:flutter/material.dart';
import 'package:homepage/geometry/lingkaran.dart';
import 'package:homepage/geometry/segitiga.dart';
import 'package:homepage/geometry/persegi.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penghitung Luas Bangun Datar'),
      ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SegitigaPage()),
                );
              },
              child: const Text('Luas Segitiga'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersegiPage()),
                );
              },
              child: const Text('Luas Persegi'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LingkaranPage()),
                );
              },
              child: const Text('Luas Lingkaran'),
            ),
          ],
        ),
      ),
    );
  }
}
