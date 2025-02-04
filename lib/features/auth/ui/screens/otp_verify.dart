import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:travenor/app/colors.dart';
import 'package:travenor/features/auth/ui/widgets/auth_title_section.dart';
import 'package:travenor/features/common/ui/widgets/app_icon_button.dart';
import 'package:travenor/features/common/ui/widgets/app_primary_button.dart';

class OtpVerify extends StatefulWidget {
  static const String routeName = "/otp-verify";
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final TextEditingController _pinController = TextEditingController();
  late final RxInt _resendCodeInSecs = 120.obs;
  final RxBool _isReesendCodeEnabled = false.obs;
  late Timer timer;

  void _resendCountDown() {
    _resendCodeInSecs.value = 30;
    _isReesendCodeEnabled.value = true;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_resendCodeInSecs.value == 0) {
        t.cancel();
        _isReesendCodeEnabled.value = false;
      } else {
        _resendCodeInSecs.value--;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _resendCountDown();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
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
                    title: "OTP Verification",
                    description:
                        "Please check your email www.uihut@gmail.com to see the verification code"),
              ),
              Gap(24.h),

              Text(
                "OTP code",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: "sf-d",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(16.h),
              _pinField(),
              Gap(16.h),

              AppBlueButton(
                buttonText: "Verify",
                onTap: () {},
              ),
              Gap(16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Obx(() => Visibility(
                          visible: !_isReesendCodeEnabled.value,
                          child: GestureDetector(
                            onTap: _resendCountDown,
                            child: Text(
                              "Resend Code",
                              style: TextStyle(
                                fontFamily: "sf-d",
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryGreyColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        )),
                  ),
                  Center(
                    child: Obx(
                      () => Visibility(
                        visible: _isReesendCodeEnabled.value,
                        child: Text(
                          " ${_resendCodeInSecs.value}s",
                          style: TextStyle(
                            fontFamily: "sf-d",
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGreyColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pinField() {
    return PinCodeTextField(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontFamily: "sf-d",
        fontWeight: FontWeight.w700,
      ),
      appContext: context,
      length: 4,
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _pinController,
      pinTheme: PinTheme(
          activeFillColor: AppColors.greyBackgroundIconbutton,
          fieldHeight: 56.h,
          fieldWidth: 70.w,
          inactiveFillColor: AppColors.greyBackgroundTextfield,
          selectedFillColor: AppColors.greyBackgroundTextfield,
          shape: PinCodeFieldShape.box,
          errorBorderColor: Colors.transparent,
          activeBorderWidth: 0,
          selectedBorderWidth: 0,
          inactiveBorderWidth: 0,
          borderRadius: BorderRadius.circular(16.r),
          inactiveColor: AppColors.greyBackgroundTextfield,
          activeColor: AppColors.greyBackgroundTextfield,
          selectedColor: AppColors.greyBackgroundTextfield),
    );
  }
}
