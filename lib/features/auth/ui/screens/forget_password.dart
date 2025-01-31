import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/auth/ui/widgets/auth_title_section.dart';
import 'package:travenor/features/common/ui/widgets/app_icon_button.dart';
import 'package:travenor/features/common/ui/widgets/app_primary_button.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = "/forget-password";
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: SingleChildScrollView(
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
                    title: "Forgot password",
                    description:
                        "Enter your email account to reset \nyour account password"),
              ),
              _form(),
              Gap(40.h),

              const AppBlueButton(
                buttonText: "Reset Password",
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // * FORM
  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(40.h),
        TextFormField(
          controller: emailController,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.primaryblackColor,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Email"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }
}
