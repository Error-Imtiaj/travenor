import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/features/splashScreen/ui/controllers/splash_slider_controller.dart';
import 'package:travenor/features/splashScreen/ui/widgets/onboarding_screen_widget.dart';

class FirstScreen extends StatefulWidget {
  final Function()? onTap;

  const FirstScreen({super.key, this.onTap});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScreenWidget(
        imagePath: AssetPath.splashScreenImage1,
        bodyTitle: "Life is short and the world is ",
        coloredText: "wide",
        description:
            "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
        buttonText: "Get Started",
        customPaintWidthSize: 120.w,
        customPaintHeightSize: 20.h,
        onTapBottomButton: widget.onTap,
        skipButtonOnTap:()=> Get.find<SplashSliderController>().goToAuthScreen(),
      ),
    );
  }
}
