import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/kinetic_energy_cubit.dart';
import 'main_screen.dart';

class MainScreensProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<KineticEnergyCubit>(
      create: (context) => KineticEnergyCubit(),
      child: MainScreen(),
    );
  }
}
