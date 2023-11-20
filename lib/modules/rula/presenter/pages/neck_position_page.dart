import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/app_routes.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';
import 'package:metodo_rula/core/utils/widgets/score_setter_widget.dart';

import '../controllers/neck_position_controller.dart';

class NeckPositionPage extends StatefulWidget {
  const NeckPositionPage({super.key});

  @override
  State<NeckPositionPage> createState() => NeckPositionPageState();
}

class NeckPositionPageState extends State<NeckPositionPage> {
  final controller = Modular.get<NeckPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posição do pescoço'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/neck_position.png'),
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Posicionamento do pescoço',
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
                        controller.score = score;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  for (final question in controller.sideQuestions) ...{
                    CheckboxListTile(
                      value: (question['value'] as bool),
                      onChanged: (value) {
                        setState(() {
                          question['value'] = value!;
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
                if (controller.totalTrue >= 1) {
                  controller.score += 1;
                }

                Modular.to.pushNamed('./..${AppRoutes.trunkPosition}');
              },
            ),
          ],
        ),
      ],
    );
  }
}
