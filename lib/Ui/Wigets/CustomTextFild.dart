

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Strings.dart';

class CustomTextFrom{
  
  TextStyle myStyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300);
  InputDecoration textFieldDecortion(String hint) => InputDecoration(
    hintText: hint,
    
    hintStyle: TextStyle(fontSize: 15.sp),
  );
}



