import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Colors.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/CustomBoutton.dart';
import 'package:my_application/Ui/Wigets/CustomTextFild.dart';
import 'package:my_application/Ui/Wigets/Text.dart';
import 'package:my_application/logic/form.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserFromPage extends StatelessWidget {
  TextEditingController _NameController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  Rx<TextEditingController> _DateController = TextEditingController().obs;

  String gender = "Male";
  String? dob;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _DateController.value.text = dob!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 38, right: 38).r,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90.h,
                ),
                AppStyleText(
                    text: AppString.TellUs,
                    fontsize: 35.sp,
                    FontWeight: FontWeight.w500,
                    Color: AppColors.ContinerAndTextBottonColor),
                AppStyleText(
                    text: AppString.WeWillNot,
                    fontsize: 15.sp,
                    FontWeight: FontWeight.w200,
                    Color: AppColors.TextBlackColor),
                SizedBox(
                  height: 50.h,
                ),
                TextFormField(
                  controller: _NameController,
                  keyboardType: TextInputType.name,
                  decoration:
                      CustomTextFrom().textFieldDecortion(AppString.FullName),
                ),
                TextFormField(
                  controller: _PhoneController,
                  keyboardType: TextInputType.number,
                  decoration: CustomTextFrom()
                      .textFieldDecortion(AppString.PhoneNumber),
                ),
                TextFormField(
                  controller: _AddressController,
                  keyboardType: TextInputType.text,
                  decoration:
                      CustomTextFrom().textFieldDecortion(AppString.Address),
                ),
                Obx(
                  () => TextFormField(
                    controller: _DateController.value,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: AppString.DateofBirth,
                      hintStyle: TextStyle(fontSize: 15.sp),
                      suffixIcon: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: Icon(Icons.calendar_month_rounded)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    minHeight: 45.h,
                    minWidth: 120.w,
                    fontSize: 15.sp,
                    labels: [AppString.Male, AppString.Female],
                    onToggle: (index) {
                      if (index == 0) {
                        gender = "Male";
                      } else {
                        gender = "Female";
                      }
                      print('switched to: $index');
                    },
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomBotton(
                    onPressed: () => UsersInfo().sendFormDataToDB(
                        _NameController.text,
                        int.parse(_PhoneController.text),
                        _AddressController.text,
                        dob!,
                        gender),
                    text: AppString.Submit,
                    title: AppString.plzWite),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
