import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/auth/ui/screens/sign_in.dart';
import 'package:travenor/features/auth/ui/widgets/auth_title_section.dart';
import 'package:travenor/features/auth/ui/widgets/login_with_social_widget.dart';
import 'package:travenor/features/common/ui/widgets/app_icon_button.dart';
import 'package:travenor/features/common/ui/widgets/app_primary_button.dart';

class SignUp extends StatefulWidget {
  static const String routName = "/sign-up";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String? _errorMessage;
  void _validatePassword(String value) {
    setState(() {
      _errorMessage = value.length < 8 ? "Password must be 8 characters" : null;
    });
  }

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
                    title: "Sign up now",
                    description: "Please fill the details and create account"),
              ),
              _form(),
              Gap(40.h),

              const AppBlueButton(buttonText: "Sign Up", onTap:  null,),
              Gap(40.h),
              _haveAccount(),
              Gap(40.h),
              // * SOCIAL LOGIN
              _socialLogin()
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
          controller: userNameController,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.primaryblackColor,
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Username"),
        ),
        Gap(20.h),
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
        Gap(20.h),
        TextFormField(
          controller: passController,
          onChanged: (value) => _validatePassword(value),
          obscureText: true,
          style: TextStyle(
            fontFamily: "sf-d",
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: AppColors.primaryblackColor,
          ),
          decoration: const InputDecoration(hintText: "Password"),
        ),
        if (_errorMessage != null) ...[
          Gap(10.h),
          Text(
            "  ${_errorMessage!}",
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }

  // * DON'T HAVE AN ACCOUNT
  Widget _haveAccount() {
    return Center(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "Already have an account? ",
              style: TextStyle(
                color: AppColors.primaryGreyColor,
                fontFamily: "sf-d",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            TextSpan(
                text: "Sign in",
                style: TextStyle(
                  color: AppColors.primaryBlueColor,
                  fontFamily: "sf-d",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // * NAVIGATE TO SIGN UP SCREEN
                    Get.offNamed(SignIn.routeName);
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

  // * SOCIAL LOGIN
  Widget _socialLogin() {
    return Row(
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
