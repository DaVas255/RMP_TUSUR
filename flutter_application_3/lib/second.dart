import 'dart:math';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double mass;
  final double velocity;

  SecondScreen({required this.mass, required this.velocity});

  @override
  Widget build(BuildContext context) {
    double kineticEnergy = mass * pow(velocity, 2) / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
      ),
      body: Center(
        child: Text(
          'Кинетическая энергия: ${kineticEnergy.toStringAsFixed(2)} дж',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
