import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/features/splashScreen/ui/widgets/one_time_screen_widget.dart';

class ThirdScreen extends StatefulWidget {
  final Function()? onTap;
  const ThirdScreen({super.key, this.onTap});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OneTimeScreenWidget(
        imagePath: AssetPath.splashScreenImage3,
        bodyTitle: "People don’t take trips, trips take ",
        coloredText: "people",
        description:
            "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
        buttonText: "Next",
        customPaintWidthSize: 120.w,
        customPaintHeightSize: 20.h,
        onTapBottomButton: widget.onTap,
        skipButtonOnTap: null,
      ),
    );
  }
}
