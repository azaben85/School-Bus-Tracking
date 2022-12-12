// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.black,
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
            left: 28.w,
            top: 28.h,
            child: const Icon(
              Icons.location_pin,
              size: 22,
              color: const Color.fromRGBO(249, 254, 146, 1),
            ),
          ),
          Positioned(
            left: 60.w,
            top: 28.h,
            //  bottom: 40.h,
            child: const Text('Start New Journey',
                style: TextStyle(
                    fontFamily: 'Aeonik',
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    color: const Color.fromRGBO(249, 254, 146, 1))),
          ),
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
          border: Border.all(
              color: const Color.fromRGBO(249, 254, 146, 1), width: 4.w),
          //color: Colors.yellow,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
