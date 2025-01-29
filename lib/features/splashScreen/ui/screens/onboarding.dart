import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travenor/features/splashScreen/ui/controllers/splash_slider_controller.dart';
import 'package:travenor/features/splashScreen/ui/screens/onboarding/first_screen.dart';
import 'package:travenor/features/splashScreen/ui/screens/onboarding/second_screen.dart';
import 'package:travenor/features/splashScreen/ui/screens/onboarding/third_screen.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = "/Onboarding";
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _pageController = PageController();
  final getXctrl = Get.find<SplashSliderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              FirstScreen(
                onTap: () => getXctrl.animateToNextScreen(1, _pageController),
              ),
              SecondScreen(
                onTap: () => getXctrl.animateToNextScreen(2, _pageController),
              ),
              ThirdScreen(
                onTap: () => getXctrl.goToAuthScreen(),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 140.h,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: SwapEffect(dotWidth: 10.w, dotHeight: 10.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
