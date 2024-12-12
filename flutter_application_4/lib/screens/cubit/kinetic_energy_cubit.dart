import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_screen_state.dart';

class KineticEnergyCubit extends Cubit<MainScreenState> {
  KineticEnergyCubit() : super(MainScreenInitialState());

  void calculateEnergy(double mass, double velocity) {
    double energy = mass * pow(velocity, 2) / 2;
    emit(MainScreenCalculatedState(energy));
    outputEnergy(energy);
  }

  void outputEnergy(double energy) {
    emit(MainScreenResultState('Кинетическая энергия составляет: $energy Дж'));
  }

  void clearResult() {
    emit(MainScreenInitialState());
  }
}
