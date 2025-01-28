import 'package:flutter/material.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/splash/ui/widgets/titile_widget_for_splashscreen.dart';

class SplashScreen extends StatefulWidget {
  final String appName;
  const SplashScreen({super.key, required this.appName});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBlueColor,
      body: Center(
        child: TitleWidgetForSplashScreen(
          text: AppConst.appName,
          fontSize: 34,
        ),
      ),
    );
  }
}
