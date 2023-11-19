abstract class TableCController {
  late int tableVerticalScoreLeft;
  late int tableVerticalScoreRight;

  late int tableHorizontalScoreLeft;
  late int tableHorizontalScoreRight;

  int get resultLeft;
  int get resultRight;
}

class TableCControllerImpl implements TableCController {
  @override
  int tableVerticalScoreLeft = 0;

  @override
  int tableVerticalScoreRight = 0;

  @override
  int tableHorizontalScoreLeft = 0;

  @override
  int tableHorizontalScoreRight = 0;

  List<List<int>> tableCScore = [
    [1, 2, 3, 3, 4, 5, 5],
    [2, 2, 3, 4, 4, 5, 5],
    [3, 3, 3, 4, 4, 5, 6],
    [3, 3, 3, 4, 5, 6, 6],
    [4, 4, 4, 5, 6, 7, 7],
    [4, 4, 4, 5, 6, 7, 7],
    [5, 5, 6, 6, 7, 7, 7],
    [5, 5, 6, 7, 7, 7, 7],
  ];

  @override
  int get resultLeft {
    int result = 0;
    if (tableHorizontalScoreLeft > 8) {
      tableHorizontalScoreLeft = 8;
    }
    if (tableVerticalScoreLeft > 7) {
      tableVerticalScoreLeft = 7;
    }
    for (int i = 0; i <= tableVerticalScoreLeft - 1; i++) {
      for (int j = 0; j <= tableHorizontalScoreLeft - 1; j++) {
        result = tableCScore[i][j];
      }
    }
    return result;
  }

  @override
  int get resultRight {
    int result = 0;
    if (tableHorizontalScoreRight > 8) {
      tableHorizontalScoreRight = 8;
    }
    if (tableVerticalScoreRight > 7) {
      tableVerticalScoreRight = 7;
    }
    for (int i = 0; i <= tableVerticalScoreRight - 1; i++) {
      for (int j = 0; j <= tableHorizontalScoreRight - 1; j++) {
        result = tableCScore[i][j];
      }
    }
    return result;
  }
}
