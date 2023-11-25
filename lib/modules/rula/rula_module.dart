import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/core/utils/app_routes.dart';
import 'package:metodo_rula/modules/rula/presenter/pages/arm_position_page.dart';

import 'presenter/controllers/arm_position_controller.dart';
import 'presenter/controllers/fist_position_controller.dart';
import 'presenter/controllers/forearm_controller.dart';
import 'presenter/controllers/muscular_contraction_controller.dart';
import 'presenter/controllers/neck_position_controller.dart';
import 'presenter/controllers/rula_result_controller.dart';
import 'presenter/controllers/strength_and_load_controller.dart';
import 'presenter/controllers/table_a_controller.dart';
import 'presenter/controllers/table_b_controller.dart';
import 'presenter/controllers/table_c_controller.dart';
import 'presenter/controllers/trunk_position_controller.dart';
import 'presenter/pages/arm_position_side_questions_page.dart';
import 'presenter/pages/fist_position_page.dart';
import 'presenter/pages/forearm_position_page.dart';
import 'presenter/pages/muscular_contraction_page.dart';
import 'presenter/pages/neck_position_page.dart';
import 'presenter/pages/strength_and_load_page.dart';
import 'presenter/pages/table_a_page.dart';
import 'presenter/pages/table_c_page.dart';
import 'presenter/pages/trunk_position_page.dart';

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
        Bind((i) => TrunkPositionControllerImpl()),
        Bind((i) => TableCControllerImpl()),
        Bind((i) => TableBControllerImpl()),
        Bind((i) => RulaResultControllerImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const ArmPositionPage(),
        ),
        ChildRoute(
          AppRoutes.armPositionSideQuestions,
          child: (_, args) => ArmPositionSideQuestionsPage(
            armPicture: args.data,
          ),
        ),
        ChildRoute(
          AppRoutes.forearm,
          child: (_, args) => const ForearmPositionPage(),
        ),
        ChildRoute(
          AppRoutes.fist,
          child: (_, args) => const FistPositionPage(),
        ),
        ChildRoute(
          AppRoutes.tableA,
          child: (_, args) => const TableAPage(),
        ),
        ChildRoute(
          AppRoutes.muscularContraction,
          child: (_, args) => MuscularContractionPage(legs: args.data),
        ),
        ChildRoute(
          AppRoutes.strengthAndLoad,
          child: (_, args) => StrengthAndLoadPage(legs: args.data),
        ),
        ChildRoute(
          AppRoutes.neckPosition,
          child: (_, args) => const NeckPositionPage(),
        ),
        ChildRoute(
          AppRoutes.trunkPosition,
          child: (_, args) => const TrunkPositionPage(),
        ),
        ChildRoute(
          AppRoutes.tableC,
          child: (_, args) => const TableCPage(),
        ),
      ];
}
