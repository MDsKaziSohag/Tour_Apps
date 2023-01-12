
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClipBotton extends StatelessWidget {
  final image;
  final double radius;
  final onPressed;
  CustomClipBotton(
      {Key? key,
      required this.onPressed,
      required this.image,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 35.h,
        width: 35.w,
        child: CircleAvatar(
          backgroundColor:Colors.white,
          radius: radius,
          child: ClipRRect(
            child: Image.asset(
              image,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
