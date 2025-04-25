import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wifi_service_app/base/custom_button.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/base/custom_text_field.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';
import 'package:wifi_service_app/utils/app_strings.dart';
import 'package:wifi_service_app/utils/style.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Sign Up',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Welcome!',style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              // Text sections
              SizedBox(height: 8.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Name',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter name',
                  controller: nameCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Phone Number',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter phone number',
                  controller: phoneCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Email',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter Email',
                  controller: emailCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter Password',
                  controller: emailCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Confirm Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter Confirm Password',
                  controller: emailCtrl),

              SizedBox(height: 10.h),
              /// Sing In Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.signUpCodeVerifyEmailScreen);
                },
                text:'Sign Up',
              ),
              ///==================>> Don't have and Account <===================
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signInScreen);
                      },
                      child: CustomText(
                        text: "Sign In",
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
