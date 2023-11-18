import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback onTap;
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onTap : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          enabled ? Colors.purple : Colors.grey,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: enabled ? Colors.white : Colors.grey[850],
          ),
        ),
      ),
    );
  }
}
