import 'package:bustracker/global/global_config.dart';
import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/views/widgets/custom_button_widget.dart';
import 'package:bustracker/views/widgets/label_widget.dart';
import 'package:bustracker/views/widgets/status_widget.dart';
import 'package:bustracker/views/widgets/student_status_widget.dart';
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
        title: const Text('Students'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: const Color.fromARGB(255, 252, 208, 143),
      body: Container(
        margin: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            LabelValue(
                label: 'Journey Started at:',
                value: formatDate(widget.travelHeader.startTime!)),
            const SizedBox(
              height: 15,
            ),
            if (widget.travelHeader.endTime != null)
              LabelValue(
                  label: 'Journey Ended at:',
                  value: formatDate(widget.travelHeader.endTime!)),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                StatusWidget(status: widget.travelHeader.headerStatus!),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            if (widget.travelHeader.headerStatus!.code != '20' &&
                widget.travelHeader.studentTracking!.every((element) {
                  return element.status!.code == '20' ||
                      element.status!.code == '25';
                }))
              InkWell(
                child: CustomButton(label: 'Complete Tracking'),
                onTap: () {
                  widget.travelHeader.endTime = DateTime.now();
                  widget.travelHeader.headerStatus = HeaderStatus().completed;
                  setState(() {});
                },
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
