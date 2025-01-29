import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:travenor/app/app_const.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/auth/ui/widgets/auth_title_section.dart';
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
            Gap(40.h),
            AppBlueButton(buttonText: "Sign In")
          ],
        ),
      ),
    );
  }

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
          decoration: InputDecoration(hintText: "Email"),
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
          decoration: InputDecoration(hintText: "Password"),
        ),
      ],
    );
  }
}
