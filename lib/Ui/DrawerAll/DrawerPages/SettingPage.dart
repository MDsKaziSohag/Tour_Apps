import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/DrawerItems.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

import '../../ModelsAll/Theme.dart';


class Settings extends StatelessWidget {
  RxBool darkMode = false.obs;
 final box = GetStorage();
  Future logOut(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("are u sure to logout?"),
              content: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Yes"),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("No"),
                  ),
                ],
              ),
            ));
  }

  Future changeLanguage(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
        
              title: Text("Select your language!"),
              content: Row(
                children: [
                  TextButton(onPressed: () {
                    Get.updateLocale(
                    Locale('bn', 'BD'),
                  );
                  }, child: Text("বাংলা")),
                  SizedBox(
                    width: 20.w,
                  ),
                  TextButton(onPressed: () {
                     Get.updateLocale(
                    Locale('en', 'US'),
                    
                  );
                  }, child: Text("English")),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppStyleText(
          
            text: AppString.Settings,
            fontsize: 25.sp,
            FontWeight: FontWeight.w600,
            Color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Dark Mode",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
              Obx(
                  () => Switch(
                    value: darkMode.value,
                    onChanged: (bool value) {
                      darkMode.value = value;
                      Get.changeTheme(darkMode.value == false
                          ? AppTheme().lightTheme(context)
                          : AppTheme().darkTheme(context));
                    },
                  ),
                ),
            ]),
            SizedBox(height: 15.h),
            drawerItem("Logout", () => logOut(context)),
            SizedBox(height: 15.h),
            drawerItem("Profile", () {}),
            SizedBox(height: 15.h),
            drawerItem("Languages", () => changeLanguage(context)),
          ],
        ),
      ),
    );
  }
}
