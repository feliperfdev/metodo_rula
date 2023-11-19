abstract class MuscularContractionController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  int get totalTrueInLeft;
  int get totalTrueInRight;

  int? selectedValueLeft;
  int? selectedValueRight;
}

class MuscularContractionControllerImpl
    implements MuscularContractionController {
  @override
  int leftScore = 0;

  @override
  int rightScore = 0;

  @override
  bool get buttonEnabled => leftScore != 0 && rightScore != 0;

  @override
  List<Map<String, dynamic>> sideQuestionsLeft = [
    {
      'title': 'Postura principalmente estática',
      'value': false,
    },
    {
      'title': 'Postura é dinâmica mais que 4 mov/min',
      'value': false,
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'title': 'Postura principalmente estática',
      'value': false,
    },
    {
      'title': 'Postura é dinâmica mais que 4 mov/min',
      'value': false,
    },
  ];

  @override
  int get totalTrueInLeft =>
      sideQuestionsLeft.where((element) => (element['value'] as bool)).length;

  @override
  int get totalTrueInRight =>
      sideQuestionsRight.where((element) => (element['value'] as bool)).length;

  @override
  int? selectedValueLeft = 0;

  @override
  int? selectedValueRight = 0;
}
