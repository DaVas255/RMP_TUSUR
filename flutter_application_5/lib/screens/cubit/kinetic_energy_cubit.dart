import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_screen_state.dart';
import '../DB/database.dart';

class KineticEnergyCubit extends Cubit<MainScreenState> {
  final DBProvider dbProvider = DBProvider.db;

  KineticEnergyCubit() : super(MainScreenInitialState());

  void calculateEnergy(double mass, double velocity) async {
    double energy = mass * pow(velocity, 2) / 2;
    emit(MainScreenCalculatedState(energy));
    await dbProvider.insertEnergyData(mass, velocity, energy);
  }
}
