import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wifi_service_app/base/custom_button.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/base/pin_code_text_field.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';
import 'package:wifi_service_app/utils/style.dart';

class SignUpCodeVerifyEmailScreen extends StatefulWidget {
  const SignUpCodeVerifyEmailScreen({super.key});

  @override
  State<SignUpCodeVerifyEmailScreen> createState() => _SignUpCodeVerifyEmailScreenState();
}

class _SignUpCodeVerifyEmailScreenState extends State<SignUpCodeVerifyEmailScreen> {
  TextEditingController verifyCodeCtrl = TextEditingController();
  late Timer _timer;
  int _start = 180;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Verify Your Email', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Please Check Your Email And Enter The Code', style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              SizedBox(height: 40.h),

              CustomPinCodeTextField(
                textEditingController: verifyCodeCtrl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_formatTime(_start), style: AppStyles.fontSize20(color: AppColors.greyColor, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 50.h),

              /// SaveIn Button
              CustomButton(
                onTap: () {
                  _showCustomBottomSheet(context);
                },
                text: 'Verify',
              ),


              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  //=========================>>>>>  Password Change BottomSheet    <<<================================
  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: AppColors.white,
          ),
          height: 410.h,
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              SizedBox(height: 20.h),
              SvgPicture.asset(AppIcons.changedIcon),
              SizedBox(height: 20.h),
              Text('Successfully verify!', style: AppStyles.fontSize24(color: AppColors.blackColor,fontWeight: FontWeight.w600)),
              SizedBox(height: 20.h),
              Text('Return to the login page to enter your account with your new password.',
                  style: AppStyles.fontSize16(color: AppColors.color565656),textAlign: TextAlign.center),
              SizedBox(height: 20.h),
              CustomButton(onTap: (){
                Get.toNamed(AppRoutes.signInScreen);
              }, text: "Back to Log in")
            ],
          ),
        );
      },
    );
  }
}
