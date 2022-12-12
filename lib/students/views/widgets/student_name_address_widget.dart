import 'package:bustracker/models/student_model.dart';
import 'package:bustracker/students/providers/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StudentAddressWidget extends StatelessWidget {
  Student student;
  bool editMode;
  StudentAddressWidget(
      {super.key, required this.student, this.editMode = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 48.w,
          height: 48.w,
          child: Image.network('${student.imageUrl}'),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student.name,
                  style: TextStyle(
                      fontSize: 18.sp,
                      letterSpacing: 0.02.sp,
                      fontWeight: FontWeight.w500)),
              Text(student.address,
                  style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.02.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(.6))),
            ],
          ),
        ),
        if (editMode)
          InkWell(
              onTap: () {
                Provider.of<StudentProvider>(context, listen: false)
                    .loadForUpdate(student);
              },
              child: Icon(Icons.edit))
      ],
    );
  }
}
