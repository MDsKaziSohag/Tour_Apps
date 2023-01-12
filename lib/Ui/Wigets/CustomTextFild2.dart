import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

class CustomTextFrom {
  TextEditingController Controller = TextEditingController();
  TextStyle myStyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300);
  InputDecoration textFieldDecortion(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15.sp),
      );
}

Widget CustomTextField2(  String, {keyboardType , TextEditingController, maxline,}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppStyleText(
        text: String,
        fontsize: 18.sp,
        FontWeight: FontWeight.w500,
        Color: Colors.black,
      ),
      Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(209, 243, 237, 237),
          borderRadius: BorderRadius.all(Radius.circular(7.r)),
        ),
        child: TextFormField(
          controller: TextEditingController,
          maxLines: maxline,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20.w),
          ),
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
    ],
  );
}
