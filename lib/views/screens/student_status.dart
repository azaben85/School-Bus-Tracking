// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:bustracker/views/widgets/tracking_widget.dart';
import 'package:flutter/material.dart';

import 'package:bustracker/models/student_tracking_model.dart';

class StudentTrackingScreen extends StatefulWidget {
  StudentTracking studentTracking;
  StudentTrackingScreen({
    Key? key,
    required this.studentTracking,
  }) : super(key: key);

  @override
  State<StudentTrackingScreen> createState() => _StudentTrackingScreenState();
}

class _StudentTrackingScreenState extends State<StudentTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.studentTracking.student!.name}'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: const Color.fromARGB(255, 252, 208, 143),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Journey Started at ${widget.studentTracking.startTime}',
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          // ToggleButtons(children: , isSelected: isSelected),
          Row(
            children: [
              InkWell(
                child: StatusWidget(status: StudentStatus().start),
                onTap: () {
                  widget.studentTracking
                      .setTrackingStatus(StudentStatus().start);
                  setState(() {});
                },
              ),
              InkWell(
                child: StatusWidget(status: StudentStatus().completed),
                onTap: () {
                  widget.studentTracking
                      .setTrackingStatus(StudentStatus().completed);
                  setState(() {});
                },
              )
            ],
          ),
          TackingArea(
            studentTrackingList: widget.studentTracking.studentTrackingList,
          ),
        ],
      ),
    );
  }
}
