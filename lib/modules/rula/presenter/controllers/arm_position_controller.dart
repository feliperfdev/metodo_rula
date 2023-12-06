import 'package:images_picker/images_picker.dart';

abstract class ArmPositionController {
  late int leftScore;
  late int rightScore;

  Media? armPicture;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  int get totalTrueInLeft;
  int get totalTrueInRight;

  int calculateScore(List<Map<String, dynamic>> sideQuestions);
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
      'id': 1,
      'title': 'Ombro elevado',
      'value': false,
    },
    {
      'id': 2,
      'title': 'Ombro abduzido',
      'value': false,
    },
    {
      'id': 3,
      'title': 'Braço apoiado',
      'value': false,
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'id': 1,
      'title': 'Ombro elevado',
      'value': false,
    },
    {
      'id': 2,
      'title': 'Ombro abduzido',
      'value': false,
    },
    {
      'id': 3,
      'title': 'Braço apoiado',
      'value': false,
    },
  ];

  @override
  int calculateScore(List<Map<String, dynamic>> sideQuestions) {
    int score = 0;
    for (final q in sideQuestions) {
      if (q['id'] == 1 || q['id'] == 2) {
        score += 1;
      } else if (q['id'] == 3) {
        score -= 1;
      }
    }

    return score;
  }

  @override
  int get totalTrueInLeft =>
      sideQuestionsLeft.where((element) => (element['value'] as bool)).length;

  @override
  int get totalTrueInRight =>
      sideQuestionsRight.where((element) => (element['value'] as bool)).length;

  @override
  Media? armPicture;
}
