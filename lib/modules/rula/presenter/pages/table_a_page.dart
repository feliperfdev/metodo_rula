import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/widgets/custom_button_widget.dart';
import '../controllers/arm_position_controller.dart';
import '../controllers/fist_position_controller.dart';
import '../controllers/forearm_controller.dart';
import '../controllers/table_a_controller.dart';

class TableAPage extends StatefulWidget {
  const TableAPage({super.key});

  @override
  State<TableAPage> createState() => _TableAPageState();
}

class _TableAPageState extends State<TableAPage> {
  final controller = Modular.get<TableAController>();
  final arm = Modular.get<ArmPositionController>();
  final forearm = Modular.get<ForearmPositionController>();
  final fist = Modular.get<FistPositionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Resultado para o membro superior esquerdo',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(controller
                .result(arm.leftScore, forearm.leftScore, fist.leftScore, 1)
                .toString()),
            const SizedBox(height: 30),
            const Text(
              'Resultado para o membro superior direito',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(controller
                .result(arm.rightScore, forearm.rightScore, fist.rightScore, 1)
                .toString()),
          ],
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            CustomButtonWidget(
              text: 'Próximo',
              onTap: () {
                Modular.to.pushNamed('./../table_a/');
              },
            ),
          ],
        ),
      ],
    );
  }
}
