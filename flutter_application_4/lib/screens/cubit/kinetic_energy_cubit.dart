import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class KineticEnergyCubit extends Cubit<double> {
  KineticEnergyCubit() : super(0.0);

  void calculateEnergy(double mass, double velocity) {
    double energy = mass * pow(velocity, 2) / 2;
    emit(energy);
  }
}
