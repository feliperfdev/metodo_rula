import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:metodo_rula/core/app_module.dart';
import 'package:metodo_rula/core/app_widget.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
