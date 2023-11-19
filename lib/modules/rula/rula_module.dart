import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/rula/presenter/pages/arm_position_page.dart';

import 'presenter/controllers/arm_position_controller.dart';
import 'presenter/controllers/fist_position_controller.dart';
import 'presenter/controllers/forearm_controller.dart';
import 'presenter/controllers/muscular_contraction_controller.dart';
import 'presenter/controllers/neck_position_controller.dart';
import 'presenter/controllers/strength_and_load_controller.dart';
import 'presenter/controllers/table_a_controller.dart';
import 'presenter/controllers/table_c_controller.dart';
import 'presenter/pages/arm_position_side_questions_page.dart';
import 'presenter/pages/fist_position_page.dart';
import 'presenter/pages/forearm_position_page.dart';
import 'presenter/pages/muscular_contraction_page.dart';
import 'presenter/pages/neck_position_page.dart';
import 'presenter/pages/strength_and_load_page.dart';
import 'presenter/pages/table_a_page.dart';

class RulaModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ArmPositionControllerImpl()),
        Bind((i) => ForearmPositionControllerImpl()),
        Bind((i) => FistPositionControllerImpl()),
        Bind((i) => TableAControllerImpl()),
        Bind((i) => MuscularContractionControllerImpl()),
        Bind((i) => StrengthAndLoadControllerImpl()),
        Bind((i) => NeckPositionControllerImpl()),
        Bind((i) => TableCControllerImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const ArmPositionPage(),
        ),
        ChildRoute(
          '/arm-pos-side-questions/',
          child: (_, args) => const ArmPositionSideQuestionsPage(),
        ),
        ChildRoute(
          '/forearm/',
          child: (_, args) => const ForearmPositionPage(),
        ),
        ChildRoute(
          '/fist/',
          child: (_, args) => const FistPositionPage(),
        ),
        ChildRoute(
          '/table_a/',
          child: (_, args) => const TableAPage(),
        ),
        ChildRoute(
          '/muscular_contraction/',
          child: (_, args) => const MuscularContractionPage(),
        ),
        ChildRoute(
          '/strength_and_load/',
          child: (_, args) => const StrengthAndLoadPage(),
        ),
        ChildRoute(
          '/neck_position/',
          child: (_, args) => const NeckPositionPage(),
        ),
        ChildRoute(
          '/trunk_position/',
          child: (_, args) => const NeckPositionPage(),
        ),
      ];
}
