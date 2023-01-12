import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Routs/Routs.dart';
import 'package:my_application/Ui/Wigets/Text.dart';
import 'package:my_application/Ui/viewsAll/mainHomePage.dart';
import 'package:my_application/Ui/viewsAll/onbordingPage.dart';
import 'package:my_application/Ui/viewsAll/singUp.dart';

class SplashScreen extends StatelessWidget {
  final box = GetStorage();
  
  choseScreen(context) async {
    var userID = await box.read('uid');
    if (userID != null) {
      return Get.to(() => MainHomePage());
    } else {
      return Get.to(() => onbordingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () => choseScreen(context));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              height: 300.h,
              width: 300.w,
            ),
          ],
        ),
      ),
    );
  }
}
// class SplashScreen extends StatefulWidget {
//   SplashScreen({Key? key}) : super(key: key);
//   
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
// 
// class _SplashScreenState extends State<SplashScreen> {
// final box = GetStorage();
//   choseScreen(context) async {
//     var userID = await box.read('uid');
//     if (userID != null) {
//       return Get.to(MainHomePage());
//     } else {
//       return Get.to(SplashScreen());
//     }
//   }
// 
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () => choseScreen(context));
//   }
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'images/logo.png',
//               height: 300.h,
//               width: 300.w,
//             ),
//             AppStyleText(
//                 text: AppString.AppName,
//                 fontsize: 45,
//                 FontWeight: FontWeight.w600,
//                 Color: Colors.black),
//           ],
//         ),
//       ),
//     );
//   }
// }
