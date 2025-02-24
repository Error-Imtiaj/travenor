import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travenor/app/app_bind.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/theme.dart';
import 'package:travenor/features/auth/ui/screens/forget_password.dart';
import 'package:travenor/features/auth/ui/screens/otp_verify.dart';
import 'package:travenor/features/auth/ui/screens/sign_in.dart';
import 'package:travenor/features/auth/ui/screens/sign_up.dart';
import 'package:travenor/features/common/ui/screens/nav_screen.dart';
import 'package:travenor/features/splashScreen/ui/screens/onboarding.dart';
import 'package:travenor/features/splashScreen/ui/screens/splash_screen.dart';
import 'package:travenor/features/travelDetails/ui/screens/travel_details_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (_, child) {
        return GetMaterialApp(
          initialBinding: AppBind(),
          initialRoute: SplashScreen.routeName,
          routes: {
            Onboarding.routeName: (context) => const Onboarding(),
            SignIn.routeName: (context) => const SignIn(),
            SignUp.routName: (context) => const SignUp(),
            ForgetPassword.routeName: (context) => const ForgetPassword(),
            OtpVerify.routeName: (context) => const OtpVerify(),
            NavScreen.routeName: (context) => const NavScreen(),
            TravelDetailsPage.routeName: (context) => TravelDetailsPage(
                  imagePath: Get.arguments?['imagePath'] ?? AssetPath.destinationImage2,
                ),
          },
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: const SplashScreen(appName: AppConst.appName),
        );
      },
    );
  }
}
