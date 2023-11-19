abstract class StrengthAndLoadController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  int get totalTrueInLeft;
  int get totalTrueInRight;

  int? selectedQuestionLeft;
  int? selectedQuestionRight;
}

class StrengthAndLoadControllerImpl implements StrengthAndLoadController {
  @override
  int leftScore = 0;

  @override
  int rightScore = 0;

  @override
  bool get buttonEnabled =>
      selectedQuestionLeft != null && selectedQuestionLeft != null;

  @override
  List<Map<String, dynamic>> sideQuestionsLeft = [
    {
      'title': 'Menor que 2kg | intermitente',
      'value': 0,
    },
    {
      'title': 'Entre 2 e 10kg | intermitente',
      'value': 1,
    },
    {
      'title': 'Entre 2 e 10kg | estático/repetitivo',
      'value': 2,
    },
    {
      'title': 'Maior do que 10kg / choque',
      'value': 3,
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'title': 'Menor que 2kg | intermitente',
      'value': 0,
    },
    {
      'title': 'Entre 2 e 10kg | intermitente',
      'value': 1,
    },
    {
      'title': 'Entre 2 e 10kg | estático/repetitivo',
      'value': 2,
    },
    {
      'title': 'Maior do que 10kg / choque',
      'value': 3,
    },
  ];

  @override
  int get totalTrueInLeft =>
      sideQuestionsLeft.where((element) => (element['value'] as bool)).length;

  @override
  int get totalTrueInRight =>
      sideQuestionsRight.where((element) => (element['value'] as bool)).length;

  @override
  int? selectedQuestionLeft = 0;

  @override
  int? selectedQuestionRight = 0;
}
