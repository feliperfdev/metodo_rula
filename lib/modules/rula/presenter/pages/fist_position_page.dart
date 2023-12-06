import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/app_routes.dart';
import 'package:metodo_rula/core/utils/image_picker/image_picker_widget.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';
import 'package:metodo_rula/core/utils/widgets/score_setter_widget.dart';

import '../controllers/fist_position_controller.dart';

class FistPositionPage extends StatefulWidget {
  const FistPositionPage({super.key});

  @override
  State<FistPositionPage> createState() => _FistPositionPageState();
}

class _FistPositionPageState extends State<FistPositionPage> {
  final controller = Modular.get<FistPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posição dos punhos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/fist_position.png'),
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
                    limit: 3,
                    onScore: (score) {
                      setState(() {
                        controller.leftScore = score;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  for (final question in controller.sideQuestionsLeft) ...{
                    RadioListTile<int>(
                      groupValue: controller.selectedDesvValueLeft,
                      value: (question['value'] as int),
                      onChanged: (value) {
                        setState(() {
                          controller.selectedDesvValueLeft = value!;
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
                    limit: 3,
                    onScore: (score) {
                      setState(() {
                        controller.rightScore = score;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  for (final question in controller.sideQuestionsRight) ...{
                    RadioListTile<int>(
                      groupValue: controller.selectedDesvValueRight,
                      value: (question['value'] as int),
                      onChanged: (value) {
                        setState(() {
                          controller.selectedDesvValueRight = value!;
                        });
                      },
                      title: Text(question['title']),
                    ),
                  },
                  const SizedBox(height: 60),
                  const ImagePickerWidget(),
                  const SizedBox(height: 20),
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
                Modular.to.pushNamed('./..${AppRoutes.tableA}').then(
                  (_) {
                    setState(() {
                      controller.selectedDesvValueLeft = null;
                      controller.selectedDesvValueRight = null;
                    });
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
