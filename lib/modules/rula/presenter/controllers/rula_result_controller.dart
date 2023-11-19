abstract class RulaResultController {
  String result(int tableCScore);
}

class RulaResultControllerImpl implements RulaResultController {
  @override
  String result(int tableCScore) => switch (tableCScore) {
        1 || 2 => 'Postura aceitável',
        3 || 4 => 'Investigar, possibilidade de querer mudanças',
        5 || 6 => 'Investigar, realizar mudanças rapidamente',
        7 => 'Realizar mudanças imediatas',
        int() => '',
      };
}
