abstract class StrengthAndLoadController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

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
  int? selectedQuestionLeft;

  @override
  int? selectedQuestionRight;
}
