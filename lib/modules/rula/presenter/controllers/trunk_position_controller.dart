abstract class TrunkPositionController {
  late int score;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestions;

  int get totalTrue;
}

class TrunkPositionControllerImpl implements TrunkPositionController {
  @override
  int score = 0;

  @override
  bool get buttonEnabled => score != 0;

  @override
  List<Map<String, dynamic>> sideQuestions = [
    {
      'title': 'Pescoço está torcido',
      'value': false,
    },
    {
      'title': 'Pescoço está lateralizado',
      'value': false,
    },
  ];

  @override
  int get totalTrue =>
      sideQuestions.where((element) => (element['value'] as bool)).length;
}
