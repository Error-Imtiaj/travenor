import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/auth/ui/widgets/auth_title_section.dart';
import 'package:travenor/features/auth/ui/widgets/login_with_social_widget.dart';
import 'package:travenor/features/common/ui/widgets/app_icon_button.dart';
import 'package:travenor/features/common/ui/widgets/app_primary_button.dart';

class SignIn extends StatefulWidget {
  static const String routeName = "/sign-in";
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * BACKBUTTON
            AppIconButton(
              icon: Icons.arrow_back_ios_rounded,
              backgroundColor: AppColors.greyBackgroundIconbutton,
              onTap: () => Get.back(),
            ),
            const Gap(20),
            // * TITLE SECTION
            const Center(
              child: AuthTitleSection(
                  title: "Sign in now",
                  description: "Please sign in to continue our app"),
            ),
            _form(),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: AppColors.primaryBlueColor,
                      fontFamily: "sf-d",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
              ],
            ),
            Gap(40.h),
            const AppBlueButton(buttonText: "Sign In"),
            Gap(40.h),
            _dontHaveAccount(),
            Gap(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const LoginWithSocialWidget(
                  assetPath: AssetPath.fbIcon,
                  onTap: null,
                ),
                Gap(10.w),
                const LoginWithSocialWidget(
                  assetPath: AssetPath.insIcon,
                  onTap: null,
                ),
                Gap(10.w),
                const LoginWithSocialWidget(
                  assetPath: AssetPath.twiIcon,
                  onTap: null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // * FORM
  Widget _form() {
    return Column(
      children: [
        Gap(40.h),
        TextFormField(
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.primaryblackColor,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Email"),
        ),
        Gap(20.h),
        TextFormField(
          obscureText: true,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.primaryblackColor,
          ),
          decoration: const InputDecoration(hintText: "Password"),
        ),
      ],
    );
  }

  // * DON'T HAVE AN ACCOUNT
  Widget _dontHaveAccount() {
    return Center(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: AppColors.primaryGreyColor,
                fontFamily: "sf-d",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            TextSpan(
                text: "Sign up",
                style: TextStyle(
                  color: AppColors.primaryBlueColor,
                  fontFamily: "sf-d",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // * NAVIGATE TO SIGN UP SCREEN
                  }),
            TextSpan(
              text: "\n\nOr connect",
              style: TextStyle(
                color: AppColors.primaryGreyColor,
                fontFamily: "sf-d",
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            )
          ])),
    );
  }
}
