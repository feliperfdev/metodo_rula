import 'package:flutter/material.dart';
import 'package:metodo_rula/core/utils/widgets/table_column_widget.dart';

class TableCWidget extends StatefulWidget {
  final int resultTableA;
  final int resultTableB;
  const TableCWidget({
    super.key,
    required this.resultTableA,
    required this.resultTableB,
  });

  @override
  State<TableCWidget> createState() => _TableCWidgetState();
}

class _TableCWidgetState extends State<TableCWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 35),
            ...List.generate(
              7,
              (index) => Container(
                height: 20,
                width: 35,
                color: widget.resultTableA == (index + 1)
                    ? Colors.blue
                    : Colors.white,
                child: Text(index == 6 ? '7+' : '${index + 1}'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            TableColumnWidget(
              isFirst: true,
              selectable: true,
              hasProgress: false,
              selectedFromTableB: widget.resultTableB,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              oneAppears: 1,
              twoAppears: 1,
              threeAppears: 2,
              fourAppears: 2,
              fiveAppears: 2,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              twoAppears: 2,
              threeAppears: 2,
              fourAppears: 2,
              fiveAppears: 2,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              threeAppears: 4,
              fourAppears: 2,
              sixAppears: 2,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              threeAppears: 1,
              fourAppears: 3,
              fiveAppears: 2,
              sixAppears: 1,
              sevenAppears: 1,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              fourAppears: 3,
              fiveAppears: 1,
              sixAppears: 2,
              sevenAppears: 2,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              fiveAppears: 3,
              sixAppears: 1,
              sevenAppears: 4,
            ),
            const TableColumnWidget(
              isFirst: false,
              hasProgress: true,
              fiveAppears: 2,
              sixAppears: 2,
              sevenAppears: 4,
            ),
          ],
        ),
      ],
    );
  }
}
