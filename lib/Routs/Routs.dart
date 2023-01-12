// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:my_application/Ui/viewsAll/chooseLangage.dart';
import 'package:my_application/Ui/viewsAll/onbordingPage.dart';
import 'package:my_application/Ui/viewsAll/splash.dart';

const String splashScreen = '/splash-screen';
const String onboardingPage = '/onboarding-page';
const String choosepage = '/choose-screen';


List<GetPage> pages = [
  GetPage(name: splashScreen, page: () => SplashScreen()),
  GetPage(
    name: onboardingPage,
    page: () => onbordingPage(),
  ),
  GetPage(
    name: choosepage,
    page: () => chooseLangage(),
  ),
];
