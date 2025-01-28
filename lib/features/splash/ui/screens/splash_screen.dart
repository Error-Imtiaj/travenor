import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/splash/ui/screens/first_screen.dart';
import 'package:travenor/features/splash/ui/widgets/app_name_splash.dart';

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
      Get.offNamed(FirstScreen.routeName);
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
