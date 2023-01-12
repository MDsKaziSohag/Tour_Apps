import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_application/Ui/Wigets/Text.dart';


Widget drawerItem(String itemName, onClick) {
  return InkWell(
    onTap: onClick,
    child: AppStyleText(
      text: itemName,
      fontsize: 25.sp,
      FontWeight: FontWeight.w300,
      Color: Colors.black,
    ),
  );
}
