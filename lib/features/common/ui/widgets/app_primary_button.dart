import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/colors.dart';

class AppBlueButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const AppBlueButton({
    super.key,
    this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBlueColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w700,
            color: AppColors.primaryWhiteColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
