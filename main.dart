import 'package:appimc/home_imc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyAppImc());
}

class MyAppImc extends StatelessWidget {
  const MyAppImc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyhomeiMymc(),
      debugShowCheckedModeBanner: false,
      title: 'Contador IMC',
    );
  }
}
