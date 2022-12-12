import 'package:bustracker/global/global_config.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/views/BusTrackingScreen/widgets/Journey_start_widget.dart';
import 'package:bustracker/views/BusTrackingScreen/widgets/student_status_widget.dart';
import 'package:bustracker/views/widgets/label_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class BusTrackingScreen extends StatefulWidget {
  TravelHeader travelHeader;
  BusTrackingScreen({
    Key? key,
    required this.travelHeader,
  }) : super(key: key);

  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Students',
            style: TextStyle(color: Colors.black, fontSize: 24.sp),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: globalBackgroundColor,
      body: Container(
        margin: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            StartJourneyWidget(
                label: 'Journey started at:',
                value: formatDate(widget.travelHeader.startTime!)),
            const SizedBox(
              height: 15,
            ),
            if (widget.travelHeader.endTime != null)
              LabelValue(
                  label: 'Journey Ended at:',
                  value: formatDate(widget.travelHeader.endTime!)),
            // const SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   children: [
            //     const Text(
            //       'Status: ',
            //       style: TextStyle(
            //           fontSize: 14,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     StatusWidget(status: widget.travelHeader.headerStatus!),
            //   ],
            // ),
            const SizedBox(
              height: 15,
            ),
            // if (widget.travelHeader.headerStatus!.code != '20' &&
            //     widget.travelHeader.studentTracking!.every((element) {
            //       return element.status!.code == '20' ||
            //           element.status!.code == '25';
            //     }))
            //   InkWell(
            //     child: CustomButton(label: 'Complete Tracking'),
            //     onTap: () {
            //       widget.travelHeader.endTime = DateTime.now();
            //       widget.travelHeader.headerStatus = HeaderStatus().completed;
            //       setState(() {});
            //     },
            //   ),
            Row(
              children: const [
                Text('STUDENTS'),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.travelHeader.studentTracking!.length,
                itemBuilder: (context, index) {
                  return StudentTrackingWidget(
                      travelHeader: widget.travelHeader,
                      studentTracking:
                          widget.travelHeader.studentTracking![index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
