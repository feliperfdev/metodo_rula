import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';

import '../controllers/muscular_contraction_controller.dart';
import '../controllers/strength_and_load_controller.dart';
import '../controllers/table_b_controller.dart';
import '../controllers/table_c_controller.dart';

class StrengthAndLoadPage extends StatefulWidget {
  final bool legs;
  const StrengthAndLoadPage({super.key, required this.legs});

  @override
  State<StrengthAndLoadPage> createState() => StrengthAndLoadPageState();
}

class StrengthAndLoadPageState extends State<StrengthAndLoadPage> {
  final controller = Modular.get<StrengthAndLoadController>();

  @override
  void initState() {
    if (widget.legs) {
      controller.leftScore = 0;
      controller.rightScore = 0;
      controller.selectedQuestionLeft = null;
      controller.selectedQuestionRight = null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Força e carga${widget.legs ? " (Pernas)" : ""}'),
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
                    RadioListTile<int?>(
                      groupValue: controller.selectedQuestionLeft,
                      value: (question['value'] as int),
                      onChanged: (value) {
                        setState(() {
                          controller.selectedQuestionLeft = value!;
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
                    RadioListTile<int?>(
                      groupValue: controller.selectedQuestionRight,
                      value: (question['value'] as int),
                      onChanged: (value) {
                        setState(() {
                          controller.selectedQuestionRight = value!;
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
                final tableC = Modular.get<TableCController>();
                final muscularContraction =
                    Modular.get<MuscularContractionController>();

                controller.leftScore = controller.selectedQuestionLeft!;
                controller.rightScore = controller.selectedQuestionRight!;

                if (widget.legs) {
                  final tableB = Modular.get<TableBController>();

                  tableC.tableHorizontalScoreLeft = tableB.tableBScoreLeft +
                      muscularContraction.leftScore +
                      controller.leftScore;
                  tableC.tableHorizontalScoreRight = tableB.tableBScoreRight +
                      muscularContraction.rightScore +
                      controller.rightScore;

                  Modular.to.pushNamed('./../table_c/').then(
                    (_) {
                      setState(() {
                        controller.selectedQuestionLeft = null;
                        controller.selectedQuestionRight = null;
                      });
                    },
                  );
                } else {
                  tableC.tableVerticalScoreLeft =
                      muscularContraction.leftScore + controller.leftScore;
                  tableC.tableVerticalScoreRight =
                      muscularContraction.rightScore + controller.rightScore;

                  Modular.to.pushNamed('./../neck_position/').then(
                    (_) {
                      setState(() {
                        controller.selectedQuestionLeft = null;
                        controller.selectedQuestionRight = null;
                      });
                    },
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
