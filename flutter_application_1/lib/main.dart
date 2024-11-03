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
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2UoKyN61H-7pji5xrj1hoH1u4spsrBHCbFA&s',
          ),
        ),
        ),
    )
  );
}
