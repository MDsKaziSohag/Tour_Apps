import 'package:get/get.dart';
import 'package:my_application/Constines/Strings.dart';

class OnboardingInfo {
  final LottieImageAsset;
  final title;
  final description;

  OnboardingInfo({
    required this.LottieImageAsset,
    required this.title,
    required this.description,
  });

  
}

class OnboardingController extends GetxController {

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      title: AppString.Title,
      description: AppString.Description,
      LottieImageAsset: 'files/welcome.json',
    ),
    OnboardingInfo(
      title: AppString.Title,
      description: AppString.Description,
      LottieImageAsset: 'files/99115-help-blue.json',
    ),
    OnboardingInfo(
      title: AppString.Title,
      description: AppString.Description,
      LottieImageAsset: 'files/84102-travel-icon-lottie-animation.json',
    ),
  ];
}




