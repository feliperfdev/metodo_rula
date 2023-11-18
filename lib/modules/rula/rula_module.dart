import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/rula/presenter/pages/arm_position_page.dart';

import 'presenter/controllers/arm_position_controller.dart';
import 'presenter/pages/arm_position_side_questions_page.dart';

class RulaModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ArmPositionController>(ArmPositionControllerImpl.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (_) => const ArmPositionPage(),
      ),
    );
    r.add(
      ChildRoute(
        '/arm-pos-side-questions/',
        child: (_) => const ArmPositionSideQuestionsPage(),
      ),
    );
    super.routes(r);
  }
}
