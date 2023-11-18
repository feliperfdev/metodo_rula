import 'package:flutter/material.dart';

class TableColumnWidget extends StatelessWidget {
  final bool selectable;
  final bool hasProgress;
  final bool isFirst;
  final int? oneAppears;
  final int? twoAppears;
  final int? threeAppears;
  final int? fourAppears;
  final int? fiveAppears;
  final int? sixAppears;
  final int? sevenAppears;
  final Color? oneColor;
  final Color? twoColor;
  final Color? threeColor;
  final Color? fourColor;
  final Color? fiveColor;
  final Color? sixColor;
  final Color? sevenColor;
  final int? selectedFromTableB;
  const TableColumnWidget({
    super.key,
    required this.isFirst,
    this.selectable = false,
    required this.hasProgress,
    this.oneAppears,
    this.twoAppears,
    this.threeAppears,
    this.fourAppears,
    this.fiveAppears,
    this.sixAppears,
    this.sevenAppears,
    this.oneColor = Colors.green,
    this.twoColor = Colors.green,
    this.threeColor = Colors.yellow,
    this.fourColor = Colors.yellow,
    this.fiveColor = Colors.red,
    this.sixColor = Colors.red,
    this.sevenColor = Colors.black,
    this.selectedFromTableB,
  });

  @override
  Widget build(BuildContext context) {
    return !hasProgress
        ? Column(
            children: [
              ...List.generate(
                8,
                (index) => Container(
                  height: 20,
                  width: 35,
                  color: (selectedFromTableB != null &&
                          selectedFromTableB == index + 1)
                      ? Colors.blue
                      : Colors.white,
                  child: Text(index == 7 ? '8+' : '${index + 1}'),
                ),
              ),
            ],
          )
        : Column(
            children: [
              if (oneAppears != null) ...{
                ...List.generate(
                  oneAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: oneColor,
                    child: const Text('1'),
                  ),
                ),
              },
              if (twoAppears != null) ...{
                ...List.generate(
                  twoAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: twoColor,
                    child: const Text('2'),
                  ),
                ),
              },
              if (threeAppears != null) ...{
                ...List.generate(
                  threeAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: threeColor,
                    child: const Text('3'),
                  ),
                ),
              },
              if (fourAppears != null) ...{
                ...List.generate(
                  fourAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: fourColor,
                    child: const Text('4'),
                  ),
                ),
              },
              if (fiveAppears != null) ...{
                ...List.generate(
                  fiveAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: fiveColor,
                    child: const Text('5'),
                  ),
                ),
              },
              if (sixAppears != null) ...{
                ...List.generate(
                  sixAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: sixColor,
                    child: const Text('6'),
                  ),
                ),
              },
              if (sevenAppears != null) ...{
                ...List.generate(
                  sevenAppears!,
                  (index) => Container(
                    height: 20,
                    width: 35,
                    color: sevenColor,
                    child: const Text(
                      '7',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              },
            ],
          );
  }
}
