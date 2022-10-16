import 'package:bustracker/models/student_tracking_model.dart';
import 'package:bustracker/views/screens/student_status.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:flutter/material.dart';

class StudentTrackingWidget extends StatelessWidget {
  final StudentTracking studentTracking;
  const StudentTrackingWidget({super.key, required this.studentTracking});

  @override
  Widget build(BuildContext context) {
    Color textColor = Color.fromARGB(255, 58, 58, 58);
    return Card(
      color: const Color.fromARGB(255, 255, 205, 129),
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Text('${studentTracking.student!.name}',
                    style: TextStyle(color: textColor)),
              ),
              StatusWidget(status: studentTracking.status),
            ]),
            Row(
              children: [
                Text('${studentTracking.student!.address}',
                    style: TextStyle(color: textColor)),
              ],
            ),
          ]),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return StudentTrackingScreen(
                studentTracking: studentTracking,
              );
            },
          ));
        },
      ),
    );
  }
}
