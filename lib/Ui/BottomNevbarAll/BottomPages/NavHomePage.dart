
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/BottomNevbarAll/BottomPages/SeeAll.dart';
import 'package:my_application/Ui/BottomNevbarAll/Surch.dart';
import 'package:my_application/Ui/Wigets/Text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NavHomePage extends StatelessWidget {
  final _ImageCorsol = [
    'images/cover-one.jpeg',
    'images/cover-two.jpeg',
    'images/cover-three.jpeg',
    'images/cover-two.jpeg',
    'images/cover-three.jpeg',
  ];

  RxInt _CurrentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              CarouselSlider.builder(
                itemCount: _ImageCorsol.length,
                itemBuilder: ((context, index, realIndex) {
                  final ImagesCorsol = _ImageCorsol[index];
                  return Container(
                    height: 120.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Card(
                      child: Image(
                        image: AssetImage(_ImageCorsol[_CurrentIndex.toInt()]),
                        height: 120.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
                options: CarouselOptions(
                    onPageChanged: (currentIndex, customPageChangedReason) {
                      _CurrentIndex.value = currentIndex;
                    },
                    enlargeCenterPage: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    height: 100.h),
              ),
              SizedBox(
                height: 5.h,
              ),
              Obx(() => AnimatedSmoothIndicator(
                  effect: WormEffect(
                    strokeWidth: 0,
                    type: WormType.normal,
                    dotHeight: 9.h,
                    dotWidth: 10.w,
                    radius: 100.100.r,
                    activeDotColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  axisDirection: Axis.horizontal,
                  activeIndex: _CurrentIndex.value,
                  count: _ImageCorsol.length)),
              SizedBox(
                height: 20.h,
              ), //this for carsol viewer

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30).r,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.to(SearchScreen()),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            top: 15,
                            bottom: 15,
                          ).r,
                          child: Row(
                            children: [
                              Icon(
                                Icons.search_outlined,
                                size: 20.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              AppStyleText(
                                  text: AppString.Searchforyournexttour,
                                  fontsize: 16.sp,
                                  FontWeight: FontWeight.w500,
                                  Color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppStyleText(
                            text: AppString.ForYou,
                            fontsize: 20.sp,
                            FontWeight: FontWeight.w500,
                            Color: Colors.black,
                          ),
                          InkWell(
                            onTap: () => Get.to(() => SeeAllPage()),
                            child: AppStyleText(
                              text: AppString.SeeAll,
                              fontsize: 20.sp,
                              FontWeight: FontWeight.w500,
                              Color: Color.fromARGB(226, 16, 196, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    forYou(),
                    SizedBox(height: 20.h),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppStyleText(
                            text: AppString.RecentlyAdded,
                            fontsize: 20.sp,
                            FontWeight: FontWeight.w500,
                            Color: Colors.black,
                          ),
                          InkWell(
                            onTap: () => Get.to(() => SeeAllPage()),
                            child: AppStyleText(
                              text: AppString.SeeAll,
                              fontsize: 20.sp,
                              FontWeight: FontWeight.w500,
                              Color: Color.fromARGB(226, 16, 196, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    RecentLy(),
                    SizedBox(height: 20.h),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppStyleText(
                            text: AppString.TopPlaces,
                            fontsize: 20.sp,
                            FontWeight: FontWeight.w500,
                            Color: Colors.black,
                          ),
                          InkWell(
                            onTap: () => Get.to(() => SeeAllPage()),
                            child: AppStyleText(
                              text: AppString.SeeAll,
                              fontsize: 20.sp,
                              FontWeight: FontWeight.w500,
                              Color: Color.fromARGB(226, 16, 196, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TopPlace(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget forYou() {
  return Container(
    height: 120.h,
    child: ListView.builder(
      semanticChildCount: 4,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            //onTap: () => Get.toNamed('detailsScreen'),
            child: Container(
              width: 100.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "images/logo.png",
                        height: 50.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget RecentLy() {
  return Container(
    height: 120.h,
    child: ListView.builder(
      semanticChildCount: 4,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            //onTap: () => Get.toNamed('detailsScreen'),
            child: Container(
              width: 100.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "images/logo.png",
                        height: 50.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget TopPlace() {
  return Container(
    height: 100.h,
    child: ListView.builder(
      semanticChildCount: 4,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            //onTap: () => Get.toNamed('detailsScreen'),
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Color(0xFfC4C4C4),
                borderRadius: BorderRadius.all(
                  Radius.circular(100.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        topRight: Radius.circular(7.r),
                      ),
                      child: Image.asset(
                        "images/logo.png",
                        height: 50.h,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Cost",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
