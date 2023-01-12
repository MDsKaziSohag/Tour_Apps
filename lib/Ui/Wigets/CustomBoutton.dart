import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Ui/Wigets/Text.dart';

class CustomBotton extends StatelessWidget {
  final String text;
  final String title;
  final onPressed;
  CustomBotton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.ContinerAndTextBottonColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10).r,
            child: Center(
                child: AppStyleText(
                    text: text,
                    fontsize: 15,
                    FontWeight: FontWeight.w300,
                    Color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
