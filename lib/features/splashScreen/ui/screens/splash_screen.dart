import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/common/ui/screens/nav_screen.dart';
import 'package:travenor/features/splashScreen/ui/screens/onboarding.dart';
import 'package:travenor/features/splashScreen/ui/widgets/app_name_splash.dart';

class SplashScreen extends StatefulWidget {
  final String appName;
  static const String routeName = '/';
  const SplashScreen({super.key, required this.appName});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(NavScreen.routeName);
      //Get.toNamed(Onboarding.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBlueColor,
      body: Center(
        child: AppNameSplash(
          text: AppConst.appName,
          fontSize: 34,
        ),
      ),
    );
  }
}
