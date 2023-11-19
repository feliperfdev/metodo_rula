abstract class TableAController {
  int result(int arm, int forearm, int fist, int desv);

  late int leftResult;
  late int rightResult;
}

class TableAControllerImpl implements TableAController {
  Map<dynamic, dynamic> table = {
    1: {
      // Braço
      0: {
        // Punho
        1: {
          // Desvio
          1: [1, 2, 2], // Pegar pela posição do ante-braço
          2: [2, 2, 3], // Pegar pela posição do ante-braço
        },
        2: {
          1: [2, 2, 2], // Pegar pela posição do ante-braço
          2: [2, 2, 3], // Pegar pela posição do ante-braço
        },
        3: {
          1: [2, 3, 3], // Pegar pela posição do ante-braço
          2: [3, 3, 3], // Pegar pela posição do ante-braço
        },
        4: {
          1: [3, 3, 4], // Pegar pela posição do ante-braço
          2: [3, 3, 4], // Pegar pela posição do ante-braço
        },
      },
    },
    2: {
      0: {
        1: {
          1: [2, 2, 2], // Pegar pela posição do ante-braço
          2: [2, 2, 3], // Pegar pela posição do ante-braço
        },
        2: {
          1: [2, 2, 3], // Pegar pela posição do ante-braço
          2: [3, 3, 3], // Pegar pela posição do ante-braço
        },
        3: {
          1: [3, 3, 4], // Pegar pela posição do ante-braço
          2: [3, 3, 4], // Pegar pela posição do ante-braço
        },
        4: {
          1: [4, 4, 4], // Pegar pela posição do ante-braço
          2: [4, 4, 5], // Pegar pela posição do ante-braço
        },
      },
    },
    3: {
      0: {
        1: {
          1: [2, 2, 2], // Pegar pela posição do ante-braço
          2: [3, 3, 3], // Pegar pela posição do ante-braço
        },
        2: {
          1: [3, 3, 3], // Pegar pela posição do ante-braço
          2: [3, 3, 4], // Pegar pela posição do ante-braço
        },
        3: {
          1: [4, 4, 4], // Pegar pela posição do ante-braço
          2: [4, 4, 4], // Pegar pela posição do ante-braço
        },
        4: {
          1: [4, 5, 5], // Pegar pela posição do ante-braço
          2: [5, 5, 5], // Pegar pela posição do ante-braço
        },
      },
    },
    4: {
      0: {
        1: {
          1: [3, 3, 3], // Pegar pela posição do ante-braço
          2: [4, 4, 4], // Pegar pela posição do ante-braço
        },
        2: {
          1: [4, 4, 4], // Pegar pela posição do ante-braço
          2: [4, 4, 5], // Pegar pela posição do ante-braço
        },
        3: {
          1: [4, 4, 5], // Pegar pela posição do ante-braço
          2: [4, 4, 4], // Pegar pela posição do ante-braço
        },
        4: {
          1: [5, 5, 6], // Pegar pela posição do ante-braço
          2: [5, 5, 6], // Pegar pela posição do ante-braço
        },
      },
    },
    5: {
      0: {
        1: {
          1: [5, 5, 6], // Pegar pela posição do ante-braço
          2: [5, 6, 6], // Pegar pela posição do ante-braço
        },
        2: {
          1: [5, 6, 6], // Pegar pela posição do ante-braço
          2: [5, 6, 7], // Pegar pela posição do ante-braço
        },
        3: {
          1: [5, 6, 7], // Pegar pela posição do ante-braço
          2: [5, 7, 7], // Pegar pela posição do ante-braço
        },
        4: {
          1: [6, 7, 7], // Pegar pela posição do ante-braço
          2: [7, 7, 8], // Pegar pela posição do ante-braço
        },
      },
    },
    6: {
      0: {
        1: {
          1: [7, 7, 9], // Pegar pela posição do ante-braço
          2: [7, 8, 9], // Pegar pela posição do ante-braço
        },
        2: {
          1: [7, 8, 9], // Pegar pela posição do ante-braço
          2: [7, 8, 9], // Pegar pela posição do ante-braço
        },
        3: {
          1: [7, 8, 9], // Pegar pela posição do ante-braço
          2: [8, 9, 9], // Pegar pela posição do ante-braço
        },
        4: {
          1: [8, 9, 9], // Pegar pela posição do ante-braço
          2: [9, 9, 9], // Pegar pela posição do ante-braço
        },
      },
    }
  };

  @override
  int result(int arm, int forearm, int fist, int desv) {
    assert(
        forearm < 3, 'O campo de ante-braço somente aceita valores de 0 a 2');
    return table[arm][0][fist][desv][forearm];
  }

  @override
  int leftResult = 0;

  @override
  int rightResult = 0;
}
