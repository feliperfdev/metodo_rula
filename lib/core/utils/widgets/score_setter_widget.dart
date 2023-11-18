import 'package:flutter/material.dart';

class ScoreSetterWidget extends StatefulWidget {
  final Function(int score) onScore;
  const ScoreSetterWidget({
    super.key,
    required this.onScore,
  });

  @override
  State<ScoreSetterWidget> createState() => _ScoreSetterWidgetState();
}

class _ScoreSetterWidgetState extends State<ScoreSetterWidget> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.purple,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: score == 0
                ? null
                : () {
                    setState(() {
                      score--;
                      widget.onScore(score);
                    });
                  },
            icon: Icon(
              Icons.remove,
              color: score == 0 ? Colors.grey : Colors.purple,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            score.toString(),
            style: const TextStyle(
              fontSize: 30,
              color: Colors.purple,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              setState(() {
                score++;
                widget.onScore(score);
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
