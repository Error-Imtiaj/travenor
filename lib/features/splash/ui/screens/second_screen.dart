import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/features/splash/ui/widgets/one_time_screen_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OneTimeScreenWidget(
        imagePath: AssetPath.splashScreenImage2,
        bodyTitle: "It’s a big world out there go ",
        coloredText: "explore",
        description:
            "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
        buttonText: "Next",
        customPaintWidthSize: 120.w,
        customPaintHeightSize: 20.h,
        onTapBottomButton: null,
      ),
    );
  }
}
