

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Routs/Routs.dart';
import 'package:my_application/Ui/Wigets/Text.dart';
import 'package:my_application/Ui/viewsAll/chooseLangage.dart';
import 'package:my_application/Ui/viewsAll/singUp.dart';

class onbordingPage extends StatelessWidget {
  List<String> _lottiFiles = [
    'files/trvl2.json',
    'files/trvl.json',
    'files/welcome.json',
  ];

  List<String> _Title = [
    AppString.Welcome,
    AppString.Categories,
    AppString.Support,
  ];

  List<String> _Discription = [
    AppString.Lorem1,
    AppString.Lorem2,
    AppString.Lorem3,
  ];

  RxInt _CurrentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30).r,
          child: Column(
            children: [
              Obx(
                () => Expanded(
                    flex: 5,
                    child: Container(
                      child: Lottie.asset(_lottiFiles[_CurrentIndex.toInt()]),
                    )),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 10,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 5,
                              spreadRadius: 1.0)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => AppStyleText(
                              text: ('${_Title[_CurrentIndex.toInt()]}'),
                              fontsize: 20.sp,
                              FontWeight: FontWeight.w600,
                              Color: Colors.black)),
                          Obx(() => AppStyleText(
                              text: ('${_Discription[_CurrentIndex.toInt()]}'),
                              fontsize: 20.sp,
                              FontWeight: FontWeight.w300,
                              Color: Colors.black)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                              Obx(
                                () => DotsIndicator(
                                  
                                  dotsCount: _lottiFiles.length,
                                  position: _CurrentIndex.toDouble(),
                                  decorator: DotsDecorator(
                                    size: Size(15.w, 15.h),
                                    activeColor:
                                        AppColors.ContinerAndTextBottonColor,
                                    color: Colors.grey,
                                    activeSize: Size(17.w, 17.h),
                                    
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_CurrentIndex == _Title.length - 1) {
                                    Get.to(SingUp());
                                  } else {
                                    _CurrentIndex + 1;
                                  }
                                },
                                child: Container(
                                  height: 37.h,
                                  width: 37.w,
                                  child: Icon(Icons.skip_next),
                                  decoration: BoxDecoration(
                                      color: AppColors.backgroundColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(3.0, 3.0),
                                            blurRadius: 10,
                                            spreadRadius: 1.0),
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-4.0, -4.0),
                                            blurRadius: 3,
                                            spreadRadius: 1.0)
                                      ]),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
