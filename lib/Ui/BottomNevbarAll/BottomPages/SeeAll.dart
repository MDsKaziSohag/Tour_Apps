import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

import 'DatelsePage.dart';

class SeeAllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppStyleText(
            text: AppString.SeeAll,
            fontsize: 25.sp,
            FontWeight: FontWeight.w600,
            Color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 20,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () => Get.to(() => DetailsSCreen()),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.r),
                      topRight: Radius.circular(7.r),
                    ),
                    child: Image.asset(
                      "images/logo.png",
                      height: 115.h,
                      fit: BoxFit.cover,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
