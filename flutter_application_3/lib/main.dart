import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: const Text('Васильчиков Данил Александрович')),
          body: FirstScreen())));
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final _massController = TextEditingController();
  final _speedController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                controller: _massController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Масса (кг)'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите массу';
                  if (double.parse(value) <= 0) {
                    return 'Некорректное значение массы';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _speedController,
                decoration: const InputDecoration(labelText: 'Скорость (м/с)'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите скорость';
                  if (double.parse(value) <= 0) {
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
                    if (_formKey.currentState!.validate() && isChecked) {
                      double mass = double.parse(_massController.text);
                      double velocity = double.parse(_speedController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SecondScreen(mass: mass, velocity: velocity),
                        ),
                      );
                    } else if (!isChecked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('согласитесь на обработку')),
                      );
                    }
                  },
                  child: const Text('Решить'))
            ])));
  }
}
