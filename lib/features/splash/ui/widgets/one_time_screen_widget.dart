import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/splash/ui/widgets/title_widget_for_splash.dart';

class OneTimeScreenWidget extends StatefulWidget {
  final String imagePath;
  final String bodyTitle;
  final String coloredText;
  final String description;
  final String buttonText;
  final double customPaintWidthSize;
  final double customPaintHeightSize;
  final Function()? onTapBottomButton;
  const OneTimeScreenWidget({
    super.key,
    required this.imagePath,
    required this.bodyTitle,
    required this.coloredText,
    required this.description,
    required this.buttonText,
    required this.customPaintWidthSize,
    required this.customPaintHeightSize,
    this.onTapBottomButton,
  });

  @override
  State<OneTimeScreenWidget> createState() => _OneTimeScreenWidgetState();
}

class _OneTimeScreenWidgetState extends State<OneTimeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // * FIRST CONTAINER
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
              child: Text(
                'skip',
                style: TextStyle(
                  fontFamily: 'gil-black',
                  color: AppColors.lightBlueColor,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),

        // * SECOND CONTAINER TEXT
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: TitleWidgetForSplashes(
            text: widget.bodyTitle,
            coloredText: widget.coloredText,
            customPaintWidthSize: widget.customPaintWidthSize,
            customPaintHeightSize: widget.customPaintHeightSize,
          ),
        ),
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

        // * THIRD CONTAINER BUTTON
        Padding(
          padding: EdgeInsets.only(
                  left: AppConst.scaffoldScreenPadding.w,
                  right: AppConst.scaffoldScreenPadding.w,
                  top: 70.h)
              .w,
          child: GestureDetector(
            onTap: widget.onTapBottomButton,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontFamily: "sf-d",
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryWhiteColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
