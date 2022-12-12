import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  CustomButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(label,
              style: TextStyle(
                  color: Color.fromARGB(255, 238, 95, 95),
                  fontWeight: FontWeight.bold)),
        ));
  }
}
