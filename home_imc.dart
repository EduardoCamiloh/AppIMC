import 'package:flutter/material.dart';

class MyhomeiMymc extends StatefulWidget {
  MyhomeiMymc({super.key});

  @override
  State<MyhomeiMymc> createState() => _MyhomeState();
}

class _MyhomeState extends State<MyhomeiMymc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String infText = 'Informe seus dados';
  void botaoReset() {
    pesoController.text = '';
    alturaController.text = '';
    infText = 'Informe seus dados';
  }

  void calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      print(imc.toStringAsFixed(2));
      if (imc < 18) {
        infText = 'Abaixo do peso ${imc.toStringAsFixed(2)}';
      } else if (imc > 18 && imc < 22) {
        infText = 'na média ${imc.toStringAsFixed(2)}';
      } else if (imc > 22 && imc < 30) {
        infText = 'Peso bom ${imc.toStringAsFixed(2)}';
      } else if (imc > 30 && imc < 50) {
        infText = 'Acima do peso ${imc.toStringAsFixed(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: botaoReset,
            icon: Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          10,
          0,
          10,
          10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              controller: pesoController,
              decoration: const InputDecoration(
                labelText: 'Peso (Kg)',
                labelStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: alturaController,
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              infText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
