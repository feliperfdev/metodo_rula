import 'package:flutter_modular/flutter_modular.dart';
import 'package:metodo_rula/modules/home/home_module.dart';

import 'utils/image_picker/image_picker_controller.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ImagePickerControllerImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
