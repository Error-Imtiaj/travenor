import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/common/ui/widgets/app_primary_button.dart';
import 'package:travenor/features/splashScreen/ui/widgets/title_widget_for_splash.dart';

class OnboardingScreenWidget extends StatefulWidget {
  final String imagePath;
  final String bodyTitle;
  final String coloredText;
  final String description;
  final String buttonText;
  final double customPaintWidthSize;
  final double customPaintHeightSize;
  final Function()? onTapBottomButton;
  final Function()? skipButtonOnTap;
  const OnboardingScreenWidget({
    super.key,
    required this.imagePath,
    required this.bodyTitle,
    required this.coloredText,
    required this.description,
    required this.buttonText,
    required this.customPaintWidthSize,
    required this.customPaintHeightSize,
    this.onTapBottomButton,
    this.skipButtonOnTap,
  });

  @override
  State<OnboardingScreenWidget> createState() => _OnboardingScreenWidgetState();
}

class _OnboardingScreenWidgetState extends State<OnboardingScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // * FIRST CONTAINER - > IMAGE
        Stack(
          children: [
            Image.asset(
              width: MediaQuery.of(context).size.width,
              widget.imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: widget.skipButtonOnTap,
                child: Text(
                  'skip',
                  style: TextStyle(
                    fontFamily: 'gil-black',
                    color: AppColors.lightBlueColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),

        // * SECOND CONTAINER TEXT -> TITLE & DESCRIPTION
        // * TITLE
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 16.h),
          child: TitleWidgetForSplashes(
            text: widget.bodyTitle,
            coloredText: widget.coloredText,
            customPaintWidthSize: widget.customPaintWidthSize,
            customPaintHeightSize: widget.customPaintHeightSize,
          ),
        ),

        // * DESCRIPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            widget.description,
            style: TextStyle(
              fontFamily: "gill-sans",
              fontSize: 18.sp,
              color: AppColors.primaryGreyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // * THIRD CONTAINER BUTTON -> BUTTON
        Padding(
          padding: EdgeInsets.only(
                  left: AppConst.scaffoldScreenPadding.w,
                  right: AppConst.scaffoldScreenPadding.w,
                  top: 70.h)
              .w,
          child: AppBlueButton(
            onTap: widget.onTapBottomButton,
            buttonText: widget.buttonText,
          ),
        )
      ],
    );
  }
}
