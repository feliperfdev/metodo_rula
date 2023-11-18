import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/rula/presenter/pages/arm_position_page.dart';

class RulaModule extends Module {
  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (_) => const ArmPositionPage(),
      ),
    );
    super.routes(r);
  }
}
