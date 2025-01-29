import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/features/auth/ui/screens/sign_in.dart';

class SplashSliderController extends GetxController {
  // late Widget page;
  // late PageController controller;

  void animateToNextScreen(int page, PageController controller) {
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToAuthScreen() {
    Get.toNamed(SignIn.routeName);
  }
}
