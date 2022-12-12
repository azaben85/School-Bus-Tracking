import 'package:bustracker/app_router/app_router.dart';
import 'package:bustracker/components/custom_scaffold.dart';
import 'package:bustracker/students/providers/student_provider.dart';
import 'package:bustracker/students/views/screens/manage_student_screen.dart';
import 'package:bustracker/students/views/widgets/student_name_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayJourneyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<StudentProvider>(
      builder: (context, provider, w) {
        return CustomScaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  provider.clearFields();
                  AppRouter.appRouter.push(ManageStudent());
                },
                child: const Icon(Icons.add)),
            title: 'All Students',
            body: provider.allStudents == null
                ? const Center(
                    child: Text('No Journey Found'),
                  )
                : ListView.builder(
                    itemCount: provider.allStudents!.length,
                    itemBuilder: (context, index) {
                      return StudentAddressWidget(
                        student: provider.allStudents![index],
                      );
                    }));
      },
    );
  }
}
