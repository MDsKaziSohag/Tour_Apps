import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

class VioletButton extends StatelessWidget {
  String title;
  final Function onAction;
  VioletButton(this.title, this.onAction);

  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.ContinerAndTextBottonColor,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10).r,
              child: _value == false
                  ? Center(
                      child: AppStyleText(
                          text: title,
                          fontsize: 20.sp,
                          FontWeight: FontWeight.w300,
                          Color: Colors.white))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStyleText(
                            text: AppString.plzWite,
                            fontsize: 20.sp,
                            FontWeight: FontWeight.w300,
                            Color: Colors.white),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 18.h,
                          width: 18.h,
                          child: Expanded(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 4.0.r,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
