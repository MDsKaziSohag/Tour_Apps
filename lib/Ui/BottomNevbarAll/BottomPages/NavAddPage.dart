import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomPages/NavAdd2page.dart';
import 'package:my_application/Ui/Wigets/Text.dart';
import 'package:my_application/logic/addform.dart';
import 'package:my_application/logic/form.dart';
import '../../../Constines/Colors.dart';
import '../../../Constines/Strings.dart';
import '../../Wigets/CustomBoutton.dart';
import '../../Wigets/CustomTextFild2.dart';
import '../../Wigets/NewBotton.dart';

class NavAddPage extends StatelessWidget {
  TextEditingController _OwnerName = TextEditingController();
  TextEditingController _Description = TextEditingController();
  TextEditingController _Cost = TextEditingController();
  TextEditingController _Facilitis = TextEditingController();
  TextEditingController _Destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0).r,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AppStyleText(
                      text: AppString.AddTours,
                      fontsize: 24.sp,
                      FontWeight: FontWeight.w600,
                      Color: AppColors.ContinerAndTextBottonColor,
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  AppStyleText(
                    text: AppString.FillOutThe,
                    fontsize: 24.sp,
                    FontWeight: FontWeight.w300,
                    Color: Colors.black,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField2(
                    AppString.OwnerName,
                    TextEditingController: _OwnerName,
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextField2(
                    AppString.Description,
                    keyboardType: TextInputType.text,
                    TextEditingController: _Description,
                  ),
                  CustomTextField2(AppString.Cost,
                      TextEditingController: _Cost,
                      keyboardType: TextInputType.number),
                  CustomTextField2(
                    AppString.Facilities,
                    keyboardType: TextInputType.text,
                    maxline: 4,
                    TextEditingController: _Facilitis,
                  ),
                  CustomTextField2(AppString.Destination),
                  CustomBotton(onPressed: ()=>Get.to(NavAdd2Page()), text: AppString.Next, title: AppString.plzWite),
                  // VioletButton("Next", ()=>Get.to(NavAdd2Page()),),
                  SizedBox(
                    height: 100.h,
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
