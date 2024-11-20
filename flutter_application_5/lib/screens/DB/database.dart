import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}energy.db';
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    print('Создание таблицы...');
    await db.execute('''
          CREATE TABLE energy_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            mass REAL,
            velocity REAL,
            energy REAL
          )
        ''');
    print('Таблица создана!');
  }

  Future<void> insertEnergyData(
      double mass, double velocity, double energy) async {
    Database db = await database;
    await db.insert(
        'energy_data', {'mass': mass, 'velocity': velocity, 'energy': energy});
  }

  Future<List<Map<String, dynamic>>> getEnergyData() async {
    Database db = await database;
    final List<Map<String, dynamic>> result = await db.query('energy_data');
    return result;
  }
}
