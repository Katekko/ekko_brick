import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final void Function(BuildContext context) onPressed;
  const SecondaryButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(context),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF757575),
        ),
      ),
    );
  }
}
