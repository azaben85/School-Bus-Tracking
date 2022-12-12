// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/students/views/widgets/student_name_address_widget.dart';
import 'package:flutter/material.dart';

import 'package:bustracker/models/student_tracking_model.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/views/screens/student_tracking_screen.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 132.h,
                margin: const EdgeInsets.all(5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 48.h,
                          child: StudentAddressWidget(
                              student: studentTracking.student!)),
                      Row(
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          SizedBox(
                              height: 32.h,
                              child:
                                  StatusWidget(status: studentTracking.status)),
                        ],
                      ),
                    ]),
              ),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
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
