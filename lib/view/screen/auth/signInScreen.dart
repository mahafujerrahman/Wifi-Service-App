import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wifi_service_app/base/custom_button.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/base/custom_text_field.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_strings.dart';
import 'package:wifi_service_app/utils/style.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
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
              SizedBox(height: 40.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Login',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Welcome Back!',style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              // Text sections
              SizedBox(height: 8.h),
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
                  controller: passCtrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //=================================> Forgot Password Button <================================
                  TextButton(
                    onPressed: () {
                        Get.toNamed(AppRoutes.forgetPasswordScreen);
                    },
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      text: 'Forgot Password?',
                      color: AppColors.blueColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// Sing In Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.homeScreen);
                },
                text:'Log In',
              ),

              ///==================> Have and Account <===================
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${AppStrings.doNotHaveAccount.tr}"),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUpScreen);
                      },
                      child: CustomText(
                        text: "Sign Up",
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
