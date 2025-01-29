import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
