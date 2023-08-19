import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String title;
  final int value;
  final int selectedValue;
  final VoidCallback onPressed;

  const CircularButton({
    required this.title,
    required this.value,
    required this.selectedValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: selectedValue == value ? Colors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.teal),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedValue == value ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}