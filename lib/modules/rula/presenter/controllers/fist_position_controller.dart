abstract class FistPositionController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  int? selectedDesvValueLeft;
  int? selectedDesvValueRight;
}

class FistPositionControllerImpl implements FistPositionController {
  @override
  int leftScore = 0;

  @override
  int rightScore = 0;

  @override
  bool get buttonEnabled =>
      leftScore != 0 &&
      rightScore != 0 &&
      selectedDesvValueLeft != null &&
      selectedDesvValueRight != null;

  @override
  List<Map<String, dynamic>> sideQuestionsLeft = [
    {
      'title': 'Desvio discreto',
      'value': 1,
    },
    {
      'title': 'Desvio acentuado',
      'value': 2,
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'title': 'Desvio discreto',
      'value': 1,
    },
    {
      'title': 'Desvio acentuado',
      'value': 2,
    },
  ];

  @override
  int? selectedDesvValueLeft;

  @override
  int? selectedDesvValueRight;
}
