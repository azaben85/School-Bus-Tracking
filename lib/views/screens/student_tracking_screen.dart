// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bustracker/global/global_config.dart';
import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/models/student_tracking_model.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/views/screens/bus_tracking.dart';
import 'package:bustracker/views/widgets/label_widget.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:bustracker/views/widgets/tracking_widget.dart';

class StudentTrackingScreen extends StatefulWidget {
  StudentTracking studentTracking;
  TravelHeader travelHeader;
  StudentTrackingScreen({
    Key? key,
    required this.studentTracking,
    required this.travelHeader,
  }) : super(key: key);

  @override
  State<StudentTrackingScreen> createState() => _StudentTrackingScreenState();
}

class _StudentTrackingScreenState extends State<StudentTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    String currentStatusCode = widget.studentTracking.status!.code!;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('${widget.studentTracking.student!.name}')),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return BusTrackingScreen(travelHeader: widget.travelHeader);
              },
            ));
          },
        ),
      ),
      backgroundColor: globalBackgroundColor,
      body: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            LabelValue(
                label: 'Journey Started at:',
                value: formatDate(widget.studentTracking.startTime!)),
            const SizedBox(
              height: 15,
            ),
            LabelValue(
              label: 'Address:',
              value: widget.studentTracking.student!.address!,
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                if (currentStatusCode == '00' || currentStatusCode == '05')
                  StatusButton(
                    status: StudentStatus().start,
                    studentTracking: widget.studentTracking,
                    onTap: () {
                      widget.travelHeader.headerStatus = HeaderStatus().start;
                      setState(() {});
                    },
                  ),
                if (currentStatusCode == '15' || currentStatusCode == '10')
                  StatusButton(
                    status: StudentStatus().near,
                    studentTracking: widget.studentTracking,
                    onTap: () {
                      widget.travelHeader.headerStatus = HeaderStatus().start;
                      setState(() {});
                    },
                  ),
                if (currentStatusCode == '15' || currentStatusCode == '10')
                  StatusButton(
                    status: StudentStatus().completed,
                    studentTracking: widget.studentTracking,
                    onTap: () {
                      widget.travelHeader.headerStatus = HeaderStatus().start;
                      setState(() {});
                    },
                  ),
                if (currentStatusCode != '00' && currentStatusCode != '05')
                  StatusButton(
                    status: StudentStatus().changedDirection,
                    studentTracking: widget.studentTracking,
                    onTap: () {
                      setState(() {});
                    },
                  ),
                if (currentStatusCode == '20')
                  StatusButton(
                    status: StudentStatus().confirmedByParent,
                    studentTracking: widget.studentTracking,
                    onTap: () {
                      setState(() {});
                    },
                  ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TackingArea(
                studentTrackingList: widget.studentTracking.studentTrackingList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  StudentTracking studentTracking;
  Status status;
  Function? onTap;
  StatusButton(
      {super.key,
      required this.studentTracking,
      required this.status,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: StatusButtonWidget(status: status),
      onTap: () {
        studentTracking.setTrackingStatus(status);
        onTap!();
      },
    );
  }
}
