import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/views/widgets/student_status_widget.dart';
import 'package:flutter/material.dart';

class BusTrackingScreen extends StatelessWidget {
  TravelHeader travelHeader;
  BusTrackingScreen({
    Key? key,
    required this.travelHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: const Color.fromARGB(255, 252, 208, 143),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Journey Started at ${travelHeader.startTime}',
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: travelHeader.studentTracking!.length,
              itemBuilder: (context, index) {
                return StudentTrackingWidget(
                    studentTracking: travelHeader.studentTracking![index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
