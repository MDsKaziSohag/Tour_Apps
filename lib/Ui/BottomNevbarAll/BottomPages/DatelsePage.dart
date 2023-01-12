import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/Detals.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

class DetailsSCreen extends StatelessWidget {
  final List _carouselImages = [
    'images/cover-one.jpeg',
    'images/cover-two.jpeg',
    'images/cover-three.jpeg',
  ];
  final RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 3.5,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 140.h,
                          onPageChanged:
                              (currentIndex, customPageChangedReason) {
                            _currentIndex.value = currentIndex;
                          }),
                      items: _carouselImages.map((image) {
                        return Container(
                          height: 140.h,
                          margin: EdgeInsets.only(left: 10, right: 10).r,
                          decoration: BoxDecoration(
                            color: AppColors.ContinerAndTextBottonColor,
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  CustomDetalse(AppString.Description, AppString.Lorem1),
                  CustomDetalse(AppString.Facilities, AppString.Lorem2),
                  CustomDetalse(AppString.Destination, AppString.Lorem3),
                  CustomDetalse(
                      AppString.DestinationDateTime, AppString.Lorem4),
                  CustomDetalse(AppString.Cost, AppString.Taka),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.TextWhiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppStyleText(
                      text: AppString.OwnerName,
                      fontsize: 30.r,
                      FontWeight: FontWeight.w300,
                      Color: AppColors.ContinerAndTextBottonColor),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call_outlined,
                            color: AppColors.ContinerAndTextBottonColor,
                          )),
                      SizedBox(width: 15.w),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.message_outlined,
                            color: AppColors.ContinerAndTextBottonColor,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
