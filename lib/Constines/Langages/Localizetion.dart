import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_application/Constines/Strings.dart';
import 'package:my_application/Ui/Wigets/CustomBoutton.dart';

class HomePageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('appsName'.tr),
            Text('appsTitle'.tr),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    Locale('bn', 'BD'),
                  );
                },
                child: Text('Bangla')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(
                    Locale('en', 'US'),
                  );
                },
                child: Text('English')),
          ],
        ),
      ),
    );
  }
}
