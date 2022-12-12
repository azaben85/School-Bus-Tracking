// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartJourneyWidget extends StatelessWidget {
  String? label;
  String? value;
  StartJourneyWidget({
    super.key,
    this.label,
    this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Color.fromRGBO(249, 254, 146, 1),
      ),
      width: 334.w,
      height: 80.h,
      child: Stack(
        children: [
          Positioned(
            right: 5.w,
            top: 14.h,
            child: CirculCurve(
              width: 104.w,
              height: 104.h,
            ),
          ),
          Positioned(
            top: -42.h,
            right: -87.w,
            child: CirculCurve(
              width: 168.w,
              height: 168.h,
            ),
          ),
          Positioned(
              left: 24.w,
              top: 20.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$label',
                    style: TextStyle(
                        fontSize: 14.sp,
                        letterSpacing: 0.02.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '$value',
                    style: TextStyle(
                        fontSize: 17.sp,
                        letterSpacing: 0.03.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CirculCurve extends StatelessWidget {
  double width;
  double height;
  CirculCurve({
    Key? key,
    this.width = 0,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.w),
          //color: Colors.yellow,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
