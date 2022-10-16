import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/models/student_tracking_model.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/repositories/students.dart';
import 'package:bustracker/repositories/travel_header_list.dart';
import 'package:bustracker/views/screens/bus_tracking.dart';
import 'package:bustracker/views/widgets/student_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 208, 143),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          InkWell(
            child: const Text('Start Journey'),
            onTap: () {
              TravelHeader travelHeader = TravelHeader(
                  headerStatus: HeaderStatus().completed,
                  startTime: DateTime.now());
              travelHeader.studentTracking = students_model
                  .map((student) => StudentTracking(
                        student: student,
                        status: StudentStatus().pending,
                      ))
                  .toList();
              travelHeaderList.add(travelHeader);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return BusTrackingScreen(
                    travelHeader: travelHeader,
                  );
                },
              ));
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students_model.length,
              itemBuilder: (context, index) {
                return StudentWidget(student: students_model[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
