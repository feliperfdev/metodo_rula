import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/rula/presenter/pages/arm_position_page.dart';

import 'presenter/controllers/arm_position_controller.dart';
import 'presenter/controllers/fist_position_controller.dart';
import 'presenter/controllers/forearm_controller.dart';
import 'presenter/controllers/table_a_controller.dart';
import 'presenter/pages/arm_position_side_questions_page.dart';
import 'presenter/pages/fist_position_page.dart';
import 'presenter/pages/forearm_position_page.dart';
import 'presenter/pages/table_a_page.dart';

class RulaModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ArmPositionControllerImpl()),
        Bind((i) => ForearmPositionControllerImpl()),
        Bind((i) => FistPositionControllerImpl()),
        Bind((i) => TableAControllerImpl()),
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
      ];
}
