abstract class ArmPositionController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  int get totalTrueInLeft;
  int get totalTrueInRight;
}

class ArmPositionControllerImpl implements ArmPositionController {
  @override
  int leftScore = 0;

  @override
  int rightScore = 0;

  @override
  bool get buttonEnabled => leftScore != 0 && rightScore != 0;

  @override
  List<Map<String, dynamic>> sideQuestionsLeft = [
    {
      'title': 'Ombro elevado',
      'value': false,
    },
    {
      'title': 'Ombro abduzido',
      'value': false,
    },
    {
      'title': 'Braço apoiado',
      'value': false,
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'title': 'Ombro elevado',
      'value': false,
    },
    {
      'title': 'Ombro abduzido',
      'value': false,
    },
    {
      'title': 'Braço apoiado',
      'value': false,
    },
  ];

  @override
  int get totalTrueInLeft =>
      sideQuestionsLeft.where((element) => (element['value'] as bool)).length;

  @override
  int get totalTrueInRight =>
      sideQuestionsRight.where((element) => (element['value'] as bool)).length;
}
