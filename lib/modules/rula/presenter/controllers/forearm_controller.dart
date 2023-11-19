abstract class ForearmPositionController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  String? selectedValueLeft;
  String? selectedValueRight;
}

class ForearmPositionControllerImpl implements ForearmPositionController {
  @override
  int leftScore = 0;

  @override
  int rightScore = 0;

  @override
  bool get buttonEnabled =>
      (selectedValueLeft != null && selectedValueLeft!.isNotEmpty) &&
      (selectedValueRight != null && selectedValueRight!.isNotEmpty);

  @override
  List<Map<String, dynamic>> sideQuestionsLeft = [
    {
      'title': 'Rotação interna do ombro',
      'value': 'f9fb4056-373b-4cfb-8ee8-ee72bdbc9a7b',
    },
    {
      'title': 'Rotação externa do ombro',
      'value': 'd88f1953-4ae0-4ab9-8a65-0202aff56784',
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'title': 'Rotação interna do ombro',
      'value': 'f9fb4056-373b-4cfb-8ee8-ee72bdbc9a7b',
    },
    {
      'title': 'Rotação externa do ombro',
      'value': 'd88f1953-4ae0-4ab9-8a65-0202aff56784',
    },
  ];

  @override
  String? selectedValueLeft;

  @override
  String? selectedValueRight;
}
