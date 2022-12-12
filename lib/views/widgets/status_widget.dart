import 'package:bustracker/models/status_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusWidget extends StatelessWidget {
  Status? status;
  StatusWidget({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: status!.color!,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: status!.color!)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
          child: Text('${status!.desc}',
              style: TextStyle(
                  fontSize: 15.sp,
                  letterSpacing: 0.02.sp,
                  fontWeight: FontWeight.w400)),
        ));
  }
}

class StatusButtonWidget extends StatelessWidget {
  Status? status;
  StatusButtonWidget({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: status!.color!,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: status!.color!)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text('${status!.desc}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ));
  }
}
