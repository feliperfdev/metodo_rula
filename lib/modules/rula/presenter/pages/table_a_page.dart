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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Resultado para o membro superior esquerdo',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller
                    .result(arm.leftScore, forearm.leftScore, fist.leftScore, 1)
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple[400],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Resultado para o membro superior direito',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller
                    .result(
                        arm.rightScore, forearm.rightScore, fist.rightScore, 1)
                    .toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple[400],
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            CustomButtonWidget(
              text: 'Próximo - Membros inferiores',
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
