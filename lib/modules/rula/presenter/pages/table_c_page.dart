import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';
import 'package:metodo_rula/core/utils/widgets/table_c_widget.dart';

import '../controllers/rula_result_controller.dart';
import '../controllers/table_c_controller.dart';

class TableCPage extends StatefulWidget {
  const TableCPage({super.key});

  @override
  State<TableCPage> createState() => _TableCPageState();
}

class _TableCPageState extends State<TableCPage> {
  final controller = Modular.get<TableCController>();
  final rula = Modular.get<RulaResultController>();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado RULA'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              controller.inspectionDate,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            TableCWidget(
              verticalScore: controller.tableVerticalScoreLeft,
              horizontalScore: controller.tableHorizontalScoreLeft,
            ),
            const SizedBox(height: 10),
            Text(
              'RESULTADO (Lado esquerdo): ${controller.resultLeft}',
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              rula.result(controller.resultLeft),
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
            const Divider(),
            const SizedBox(height: 40),
            TableCWidget(
              verticalScore: controller.tableVerticalScoreRight,
              horizontalScore: controller.tableHorizontalScoreRight,
            ),
            const SizedBox(height: 10),
            Text(
              'RESULTADO (Lado direito): ${controller.resultRight}',
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              rula.result(controller.resultRight),
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            CustomButtonWidget(
              text: 'Nova vistoria',
              onTap: () {
                Modular.to.navigate(Modular.initialRoute);
              },
            ),
          ],
        ),
      ],
    );
  }
}
