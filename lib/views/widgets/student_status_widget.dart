// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bustracker/models/student_tracking_model.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/views/screens/student_tracking_screen.dart';
import 'package:bustracker/views/widgets/status_widget.dart';

class StudentTrackingWidget extends StatelessWidget {
  final StudentTracking studentTracking;
  TravelHeader travelHeader;
  StudentTrackingWidget({
    Key? key,
    required this.studentTracking,
    required this.travelHeader,
  }) : super(key: key);

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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return StudentTrackingScreen(
                travelHeader: travelHeader,
                studentTracking: studentTracking,
              );
            },
          ));
        },
      ),
    );
  }
}
