

import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomPages/NavAddPage.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomPages/NavFavritePage.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomPages/NavHomePage.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

class BottomNevPage extends StatelessWidget {
  RxBool _Drawer = false.obs;

  RxInt _CurrentIndex = 0.obs;

  final _pages = [NavHomePage(), NavAddPage(), NavFavPage()];
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          top: _Drawer.value == false ? 0 : 100.h,
          bottom: _Drawer.value == false ? 0 : 100.h,
          left: _Drawer.value == false ? 0 : 250.w,
          right: _Drawer.value == false ? 0 : -100.w,
          duration: Duration(microseconds: 400),
          child: Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70.h,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Row(
                    
                    children: [
                        SizedBox(width: 20.w,),
                        Image.asset(
                        'images/logo.png',
                        height: 50.h,
                      ),
                      SizedBox(width: 10.w,),
                      AppStyleText(
                          text: AppString.AppName,
                          fontsize: 30.h,
                          FontWeight: FontWeight.w600,
                          Color: Color.fromARGB(255, 255, 0, 0)),
                    
                    ],
                  ),
                  centerTitle: true,

                  leading: _Drawer.value == false
                      ? IconButton(
                          onPressed: () {
                            _Drawer.value = true;
                          },
                          icon: Icon(
                            Icons.menu_outlined,
                            color: Colors.black,
                          ),
                          iconSize: 30.h,
                        )
                      : IconButton(
                          onPressed: () {
                            _Drawer.value = false;
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            color: Colors.black,
                          )),
                ),
                bottomNavigationBar: Container(
                  height: 70.h,
                  child: BottomNavigationBar(
                      selectedItemColor: AppColors.ContinerAndTextBottonColor,
                      selectedFontSize: 15.h,
                      unselectedFontSize: 17.h,
                      iconSize: 23.h,
                      onTap: (value) => _CurrentIndex.value = value,
                      currentIndex: _CurrentIndex.value,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.add_outlined), label: 'Add'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite_rounded),
                            label: 'Favorite'),
                      ]),
                ),
                body: _pages[_CurrentIndex.value],
              ),
            ),
          ),
        ));
  }
}
