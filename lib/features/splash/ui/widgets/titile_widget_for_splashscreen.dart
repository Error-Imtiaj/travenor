import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/colors.dart';

class TitleWidgetForSplashScreen extends StatelessWidget {
  const TitleWidgetForSplashScreen({
    super.key, required this.text, required this.fontSize,
   
  });
  final double fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'blk-bt',
        color: AppColors.primaryWhiteColor,
      ),
    );
  }
}
