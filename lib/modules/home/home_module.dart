import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/home/controllers/home_controller.dart';
import 'package:metodo_rula/modules/home/pages/home_page.dart';

import '../rula/rula_module.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HomeControllerImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomePage(),
        ),
        ModuleRoute(
          '/rula/',
          module: RulaModule(),
        ),
      ];
}
