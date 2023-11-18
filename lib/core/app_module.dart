import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.add(
      ModuleRoute(
        Modular.initialRoute,
        module: HomeModule(),
      ),
    );
    super.routes(r);
  }
}
