abstract class TableBController {
  int result(int pescoco, int tronco, int perna);
  late int tableBScore;
}

class TableBControllerImpl implements TableBController {
  Map<dynamic, dynamic> tableB = {
    // tronco
    1: {
      // perna
      1: [1, 1, 2, 2, 3], // posição do pescoço
      2: [2, 2, 2, 3, 4],
    },
    2: {
      1: [1, 2, 2, 2, 4],
      2: [2, 2, 3, 3, 4],
    },
    3: {
      1: [2, 3, 3, 3, 4],
      2: [3, 4, 4, 4, 5],
    },
    4: {
      1: [3, 4, 4, 4, 5],
      2: [4, 5, 5, 5, 6],
    },
    5: {
      1: [4, 5, 5, 6, 6],
      2: [4, 5, 5, 6, 6],
    },
    6: {
      1: [4, 5, 6, 6, 6],
      2: [4, 5, 6, 6, 6],
    },
  };

  @override
  int result(int pescoco, int tronco, int perna) {
    assert(pescoco < 5, 'Valor de pescoço deve ser menor que 5');
    return tableB[tronco][perna][pescoco];
  }

  @override
  int tableBScore = 0;
}
