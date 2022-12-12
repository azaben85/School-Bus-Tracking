import 'package:bustracker/data_repositories/students.dart';
import 'package:bustracker/students/views/widgets/student_name_address_widget.dart';
import 'package:bustracker/views/BusTrackingScreen/widgets/Journey_start_widget.dart';
import 'package:bustracker/views/widgets/start_button_widget.dart';
import 'package:flutter/material.dart';

class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text('View Custom Widget'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StudentAddressWidget(student: students_model[0]),
            SizedBox(
              height: 20,
            ),
            StartJourneyWidget(),
            SizedBox(
              height: 20,
            ),
            StartButton(),
          ],
        ),
      ),
    );
  }
}
