import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:images_picker/images_picker.dart';
import 'package:metodo_rula/core/utils/app_routes.dart';
import 'package:metodo_rula/core/utils/image_picker/image_picker_widget.dart';
import 'package:metodo_rula/core/utils/widgets/custom_button_widget.dart';

import '../controllers/arm_position_controller.dart';

class ArmPositionSideQuestionsPage extends StatefulWidget {
  final Media? armPicture;
  const ArmPositionSideQuestionsPage({
    super.key,
    this.armPicture,
  });

  @override
  State<ArmPositionSideQuestionsPage> createState() =>
      _ArmPositionSideQuestionsPageState();
}

class _ArmPositionSideQuestionsPageState
    extends State<ArmPositionSideQuestionsPage> {
  final controller = Modular.get<ArmPositionController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        controller
          ..sideQuestionsLeft = controller.sideQuestionsLeft.map(
            (e) {
              e['value'] = false;
              return e;
            },
          ).toList()
          ..sideQuestionsRight = controller.sideQuestionsRight.map(
            (e) {
              e['value'] = false;
              return e;
            },
          ).toList();
      },
      child: Scaffold(
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
              const SizedBox(height: 100),
              ImagePickerWidget(
                importedMedia: widget.armPicture,
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
                  controller.leftScore =
                      controller.calculateScore(controller.sideQuestionsLeft);
                  controller.rightScore =
                      controller.calculateScore(controller.sideQuestionsRight);
                  Modular.to.pushNamed('./..${AppRoutes.forearm}').then(
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
      ),
    );
  }
}
