import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/DrawerAll/DrawerPages/FavPage.dart';
import 'package:my_application/Ui/DrawerAll/DrawerPages/HowtoUse.dart';
import 'package:my_application/Ui/DrawerAll/DrawerPages/PrivacyPage.dart';
import 'package:my_application/Ui/DrawerAll/DrawerPages/RateUs.dart';
import 'package:my_application/Ui/DrawerAll/DrawerPages/SettingPage.dart';
import 'package:my_application/Ui/DrawerAll/DrawerPages/SupportPage.dart';
import 'package:my_application/Ui/Wigets/DrawerItems.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

class DrowerScreen extends StatelessWidget {
  const DrowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(10, 96, 125, 139),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 50, bottom: 30).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            AppStyleText(
              text: AppString.AppName,
              fontsize: 40.sp,
              FontWeight: FontWeight.w600,
              Color: Colors.black,
            ),
            AppStyleText(
              text: AppString.TravelAgency,
              fontsize: 17.sp,
              FontWeight: FontWeight.w500,
              Color: Colors.black,
            ),
            SizedBox(
              height: 25.h,
            ),
            drawerItem(AppString.Support, () => Get.to(SupportPage())),
            SizedBox(
              height: 25.h,
            ),
            drawerItem(AppString.Privacy, () => Get.to(PrivacyPage())),
            SizedBox(
              height: 25.h,
            ),
            drawerItem(AppString.FAQ, () => Get.to(FavPage())),
            SizedBox(
              height: 25.h,
            ),
            drawerItem(AppString.RateUs, () => Get.to(RateUsPage())),
            SizedBox(
              height: 25.h,
            ),
            drawerItem(AppString.Howtouse, () => Get.to(HowtoUsePage())),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () => Get.to(Settings()),
              child: AppStyleText(
                text: AppString.Settings,
                fontsize: 30.sp,
                FontWeight: FontWeight.w500,
                Color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
