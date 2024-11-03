import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Васильчиков Данил Александрович',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300.0,
                  height: 300.0,
                  color: Colors.red,
                ),
                Container(
                  width: 280.0,
                  height: 280.0,
                  color: Colors.orange,
                ),
                Container(
                  width: 260.0,
                  height: 260.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 240.0,
                  height: 240.0,
                  color: Colors.green,
                ),
                Container(
                  width: 220.0,
                  height: 220.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.indigo,
                ),
                Container(
                  width: 180.0,
                  height: 180.0,
                  color: Colors.purple,
                ),
              ],
            ),
          )),
    ),
  );
}
