
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/NewBotton.dart';
import 'package:my_application/Ui/Wigets/Text.dart';
import 'package:my_application/Ui/Wigets/CustomCipObal.dart';
import 'package:my_application/Ui/Wigets/CustomTextFild.dart';
import 'package:my_application/Ui/viewsAll/singUp.dart';
import 'package:my_application/logic/auth_helper.dart';

class Login extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 38, right: 38).r,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55.h,
                ),
                AppStyleText(
                    text: AppString.LoginYourAccount,
                    fontsize: 35.sp,
                    FontWeight: FontWeight.w500,
                    Color: AppColors.ContinerAndTextBottonColor),
                AppStyleText(
                    text: AppString.CareateYour,
                    fontsize: 15.sp,
                    FontWeight: FontWeight.w200,
                    Color: AppColors.TextBlackColor),
                SizedBox(
                  height: 60.h,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      CustomTextFrom().textFieldDecortion(AppString.Email),
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: CustomTextFrom()
                      .textFieldDecortion(AppString.EnterPassworde),
                ),
                SizedBox(
                  height: 100.h,
                ),
                VioletButton(
                    AppString.Login,
                    () => AuthHelper().login(_emailController.text,
                        _passwordController.text, context)),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: AppStyleText(
                      text: AppString.OR,
                      fontsize: 15.sp,
                      FontWeight: FontWeight.w300,
                      Color: AppColors.TextBlackColor),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomClipBotton(
                        onPressed: () {},
                        image: 'icons/facebook.png',
                        radius: 35.0.r),
                    SizedBox(
                      width: 15.w,
                    ),
                    CustomClipBotton(
                        onPressed: () {},
                        image: 'icons/google.png',
                        radius: 35.0.r),
                  ],
                ),
                SizedBox(
                  height: 55.h,
                ),
                RichText(
                  text: TextSpan(
                    text: AppString.DontHave,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: AppString.SingUp,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w200,
                          color: AppColors.ContinerAndTextBottonColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(SingUp()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
