
import 'package:bustracker/models/student_model.dart';
import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {
  final Student student;
  const StudentWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    Color textColor = Color.fromARGB(255, 58, 58, 58);
    return Card(
      color: const Color.fromARGB(255, 255, 205, 129),
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(children: [
          Row(children: [
            Text('${student.name}', style: TextStyle(color: textColor)),
          ]),
          Row(
            children: [
              Text('${student.address}', style: TextStyle(color: textColor)),
            ],
          ),
        ]),
      ),
    );
  }
}
