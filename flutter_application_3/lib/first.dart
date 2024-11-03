import 'package:flutter/material.dart';
import 'second.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController massController = TextEditingController();
  TextEditingController velocityController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Васильчиков Данил Александрович'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: massController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Масса тела (кг)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите массу тела';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Введите число большее 0';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: velocityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Скорость (м/с)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите скорость';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Введите число большее 0';
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
                  Text('Я согласен на условия использования'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && isChecked) {
                    double mass = double.parse(massController.text);
                    double velocity = double.parse(velocityController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen(mass: mass, velocity: velocity),
                      ),
                    );
                  } else if (!isChecked) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Вам необходимо согласиться с условиями использования')),
                    );
                  }
                },
                child: Text('Вычислить кинетическую энергию'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
