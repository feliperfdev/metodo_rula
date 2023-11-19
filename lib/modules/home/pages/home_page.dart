import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método RULA'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            children: [
              Text(
                'EQUIPE',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.purple,
                ),
              ),
              Text(
                'André Lucas do Nascimento dos Santos',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14.5,
                ),
              ),
              Text(
                'Daniel Barbosa Bastos',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14.5,
                ),
              ),
              Text(
                'Felipe Azevedo Ribeiro',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14.5,
                ),
              ),
              Text(
                'João Pedro de Lima Oliveira',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/rula/');
              },
              child: const Text(
                'Iniciar método RULA',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
