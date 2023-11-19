import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';

import '../controllers/muscular_contraction_controller.dart';

class MuscularContractionPage extends StatefulWidget {
  const MuscularContractionPage({super.key});

  @override
  State<MuscularContractionPage> createState() =>
      MuscularContractionPageState();
}

class MuscularContractionPageState extends State<MuscularContractionPage> {
  final controller = Modular.get<MuscularContractionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contração muscular'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
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
                    RadioListTile<String?>(
                      value: (question['value'] as String),
                      groupValue: controller.selectedValueLeft,
                      onChanged: (value) {
                        setState(() {
                          controller.selectedValueLeft = value!;
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
                    RadioListTile<String?>(
                      value: (question['value'] as String),
                      groupValue: controller.selectedValueRight,
                      onChanged: (value) {
                        setState(() {
                          controller.selectedValueRight = value!;
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
                if (controller.selectedValueLeft!.isNotEmpty &&
                    controller.selectedValueRight!.isNotEmpty) {
                  controller.leftScore += 1;
                  controller.rightScore += 1;
                }
                Modular.to.pushNamed('./../strength_and_load/').then(
                  (_) {
                    setState(() {
                      controller.selectedValueLeft = null;
                      controller.selectedValueRight = null;
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
