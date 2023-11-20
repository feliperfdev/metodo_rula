import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/app_routes.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';
import 'package:metodo_rula/core/utils/widgets/score_setter_widget.dart';

import '../controllers/arm_position_controller.dart';

class ArmPositionPage extends StatefulWidget {
  const ArmPositionPage({super.key});

  @override
  State<ArmPositionPage> createState() => _ArmPositionPageState();
}

class _ArmPositionPageState extends State<ArmPositionPage> {
  final controller = Modular.get<ArmPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posição dos braços'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/arm_position.png'),
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Lado esquerdo',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ScoreSetterWidget(
                    limit: 4,
                    onScore: (score) {
                      setState(() {
                        controller.leftScore = score;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Lado direito',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ScoreSetterWidget(
                    limit: 4,
                    onScore: (score) {
                      setState(() {
                        controller.rightScore = score;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            CustomButtonWidget(
              enabled: controller.buttonEnabled,
              text: 'Próximo',
              onTap: () {
                Modular.to.pushNamed('.${AppRoutes.armPositionSideQuestions}');
              },
            ),
          ],
        ),
      ],
    );
  }
}
