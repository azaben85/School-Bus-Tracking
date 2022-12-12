// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bustracker/global/global_config.dart';
import 'package:bustracker/students/providers/student_provider.dart';
import 'package:bustracker/students/views/widgets/student_name_address_widget.dart';
import 'package:bustracker/views/screens/test_screen.dart';
import 'package:bustracker/views/widgets/custom_button_widget.dart';
import 'package:bustracker/views/widgets/start_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:bustracker/models/status_model.dart';
import 'package:bustracker/models/student_tracking_model.dart';
import 'package:bustracker/models/travel_tracking_header_model.dart';
import 'package:bustracker/data_repositories/students.dart';
import 'package:bustracker/data_repositories/travel_header_list.dart';
import 'package:bustracker/views/BusTrackingScreen/bus_tracking.dart';
import 'package:bustracker/views/widgets/student_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: globalBackgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          InkWell(
            child: StartButton(),
            onTap: () {
              TravelHeader travelHeader = TravelHeader(
                  headerStatus: HeaderStatus().pending,
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
          InkWell(
            child: CustomButton(label: 'Test Widgets'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const TestWidgets();
                },
              ));
            },
          ),
          Consumer<StudentProvider>(builder: (context, provider, w) {
            return Expanded(
                child: provider.allStudents == null
                    ? const Center(
                        child: Text('No Categories Found'),
                      )
                    : ListView.builder(
                        itemCount: provider.allStudents!.length,
                        itemBuilder: (context, index) {
                          return StudentAddressWidget(
                              student: provider.allStudents![index]);
                        }));
          }),
        ],
      ),
    );
  }
}
