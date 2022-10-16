import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  const LabelValue({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label ',
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
