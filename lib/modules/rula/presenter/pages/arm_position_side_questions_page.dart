import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';

import '../controllers/arm_position_controller.dart';

class ArmPositionSideQuestionsPage extends StatefulWidget {
  const ArmPositionSideQuestionsPage({super.key});

  @override
  State<ArmPositionSideQuestionsPage> createState() =>
      _ArmPositionSideQuestionsPageState();
}

class _ArmPositionSideQuestionsPageState
    extends State<ArmPositionSideQuestionsPage> {
  final controller = Modular.get<ArmPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posição dos braços'),
      ),
      body: SingleChildScrollView(
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
                  for (final question in controller.sideQuestionsLeft) ...{
                    CheckboxListTile(
                      value: question['value'],
                      onChanged: (value) {
                        setState(() {
                          question['value'] = value;
                        });
                      },
                      title: Text(question['title']),
                    ),
                  },
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
                  for (final question in controller.sideQuestionsRight) ...{
                    CheckboxListTile(
                      value: question['value'],
                      onChanged: (value) {
                        setState(() {
                          question['value'] = value;
                        });
                      },
                      title: Text(question['title']),
                    ),
                  },
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
              text: 'Próximo',
              onTap: () {
                controller.leftScore += controller.totalTrueInLeft;
                controller.rightScore += controller.totalTrueInRight;
              },
            ),
          ],
        ),
      ],
    );
  }
}
