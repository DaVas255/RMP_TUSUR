// main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/kinetic_energy_cubit.dart';
import 'cubit/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController massController = TextEditingController();
  final TextEditingController speedController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Васильчиков Данил Александрович')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: massController,
              decoration: const InputDecoration(labelText: 'Масса (кг)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Введите массу';
                if (double.tryParse(value) == null ||
                    double.parse(value) <= 0) {
                  return 'Некорректное значение массы';
                }
                return null;
              },
            ),
            TextFormField(
              controller: speedController,
              decoration: const InputDecoration(labelText: 'Скорость (м/с)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Введите скорость';
                if (double.tryParse(value) == null ||
                    double.parse(value) <= 0) {
                  return 'Некорректное значение скорости';
                }
                return null;
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Text('Я согласен с обработкой данных'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate() && isChecked) {
                  double mass = double.parse(massController.text);
                  double velocity = double.parse(speedController.text);
                  context
                      .read<KineticEnergyCubit>()
                      .calculateEnergy(mass, velocity);
                } else if (!isChecked) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('согласитесь на обработку')),
                  );
                }
              },
              child: const Text('Рассчитать'),
            ),
            BlocBuilder<KineticEnergyCubit, MainScreenState>(
              builder: (context, state) {
                if (state is MainScreenCalculatedState) {
                  return Text('Энергия: ${state.energy} Дж');
                } else if (state is MainScreenInitialState) {
                  return const Text('Энергия: 0.0 Дж');
                } else {
                  return const Text("error");
                }
              }
            ),
          ]),
        ),
      ),
    );
  }
}
