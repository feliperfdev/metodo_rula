import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/home/controllers/home_controller.dart';
import 'package:metodo_rula/modules/home/pages/home_page.dart';

import '../rula/rula_module.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(HomeControllerImpl.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (_) => const HomePage(),
      ),
    );
    r.add(
      ModuleRoute(
        '/rula/',
        module: RulaModule(),
      ),
    );
    super.routes(r);
  }
}
