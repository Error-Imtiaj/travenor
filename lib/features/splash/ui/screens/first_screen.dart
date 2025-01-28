import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/splash/ui/widgets/title_widget_for_splash.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  static const String routeName = '/first_screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * FIRST CONTAINER
          Stack(
            children: [
              Image.asset(
                width: MediaQuery.of(context).size.width,
                AssetPath.splashScreenImage1,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: TitleWidgetForSplashes(
              text: "Life is short and the world is ",
              coloredText: "wide",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world",
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
            padding: EdgeInsets.all(AppConst.scaffoldScreenPadding).w,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryBlueColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontFamily: "sf-d",
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryWhiteColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
