import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double mass;
  final double velocity;

  SecondScreen({required this.mass, required this.velocity});

  @override
  Widget build(BuildContext context) {
    double kineticEnergy = 0.5 * mass * velocity * velocity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Результат вычислений'),
      ),
      body: Center(
        child: Text(
          'Кинетическая энергия = ${kineticEnergy.toStringAsFixed(10)} Дж',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
