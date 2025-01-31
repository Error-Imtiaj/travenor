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

              AppBlueButton(
                buttonText: "Reset Password",
                onTap: showEmailDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // * DIALOGUE BOX
  void showEmailDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 335, // Matching your design width
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.mark_email_unread_rounded,
                size: 50,
                color: AppColors.primaryBlueColor,
              ),
              const SizedBox(height: 10),
              Text(
                "Check your email",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "sf-d"),
              ),
              const SizedBox(height: 10),
              Text(
                "We have sent password recovery instructions to your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primaryGreyColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: "sf-d"),
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
