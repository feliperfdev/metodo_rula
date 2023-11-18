import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Modular.to.pushNamed('/rula/');
            },
            child: const Text('Iniciar método RULA'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
