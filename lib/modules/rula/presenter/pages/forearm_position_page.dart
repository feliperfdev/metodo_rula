import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';
import 'package:metodo_rula/core/utils/widgets/score_setter_widget.dart';

import '../controllers/forearm_controller.dart';

class ForearmPositionPage extends StatefulWidget {
  const ForearmPositionPage({super.key});

  @override
  State<ForearmPositionPage> createState() => _ForearmPositionPageState();
}

class _ForearmPositionPageState extends State<ForearmPositionPage> {
  final controller = Modular.get<ForearmPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posição dos ante-braços'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/forearm_position.png'),
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
                    limit: 2,
                    onScore: (score) {
                      setState(() {
                        controller.leftScore = score;
                      });
                    },
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
                  ScoreSetterWidget(
                    limit: 2,
                    onScore: (score) {
                      setState(() {
                        controller.rightScore = score;
                      });
                    },
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
              enabled: controller.buttonEnabled,
              text: 'Próximo',
              onTap: () {
                controller.leftScore += controller.totalTrueInLeft;
                controller.rightScore += controller.totalTrueInRight;
                Modular.to.pushNamed('./../fist/').then(
                  (_) {
                    for (final question in controller.sideQuestionsLeft) {
                      setState(() {
                        question['value'] = false;
                      });
                    }
                    for (final question in controller.sideQuestionsRight) {
                      setState(() {
                        question['value'] = false;
                      });
                    }
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
