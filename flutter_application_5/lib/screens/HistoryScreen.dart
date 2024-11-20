import 'package:flutter/material.dart';
import './DB/database.dart';

class HistoryScreen extends StatelessWidget {
  final DBProvider _dbHelper = DBProvider.db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('История расчетов')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _dbHelper.getEnergyData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(child: Text('История пуста'));
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                title: Text('Энергия: ${item['energy']} Дж'),
                subtitle: Text(
                    'Масса: ${item['mass']} кг, Скорость: ${item['velocity']} м/с'),
              );
            },
          );
        },
      ),
    );
  }
}
