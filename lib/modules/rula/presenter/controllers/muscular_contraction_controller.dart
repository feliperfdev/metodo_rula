abstract class MuscularContractionController {
  late int leftScore;
  late int rightScore;

  bool get buttonEnabled;

  late List<Map<String, dynamic>> sideQuestionsLeft;
  late List<Map<String, dynamic>> sideQuestionsRight;

  String? selectedValueLeft;
  String? selectedValueRight;
}

class MuscularContractionControllerImpl
    implements MuscularContractionController {
  @override
  int leftScore = 0;

  @override
  int rightScore = 0;

  @override
  bool get buttonEnabled =>
      selectedValueLeft != null && selectedValueRight != null;

  @override
  List<Map<String, dynamic>> sideQuestionsLeft = [
    {
      'title': 'Postura principalmente estática',
      'value': 'a1bd1838-4e53-439d-bf19-0586fb59f7d7',
    },
    {
      'title': 'Postura é dinâmica mais que 4 mov/min',
      'value': '47cf420c-5bfa-44cb-a75f-6f2d6cbfd740',
    },
  ];

  @override
  List<Map<String, dynamic>> sideQuestionsRight = [
    {
      'title': 'Postura principalmente estática',
      'value': 'a1bd1838-4e53-439d-bf19-0586fb59f7d7',
    },
    {
      'title': 'Postura é dinâmica mais que 4 mov/min',
      'value': '47cf420c-5bfa-44cb-a75f-6f2d6cbfd740',
    },
  ];

  @override
  String? selectedValueLeft = '';

  @override
  String? selectedValueRight = '';
}
