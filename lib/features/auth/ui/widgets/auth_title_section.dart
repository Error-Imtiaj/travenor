import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:travenor/app/colors.dart';

class AuthTitleSection extends StatelessWidget {
  final String title;
  final String description;
  const AuthTitleSection(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
            color: AppColors.primaryblackColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(15.h),
        Text(
          description,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: AppColors.primaryGreyColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
