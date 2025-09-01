import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wifi_service_app/base/custom_button.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_images.dart';

class OnboardingScreen extends StatefulWidget {
   const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController text = Get.put(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(width: 1.w, color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
                      child: InkWell(
                        onTap: (){
                         
                        },
                        child: CustomText(
                          text: 'Language',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(width: 1.w, color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.signInScreen);
                        },
                        child: CustomText(
                          text: 'Skip',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //=============================> Onboarding Img Section <========================
              SizedBox(height: 10.h),
              Image.asset(AppImages.shadhinWifi, width: 357.w, height: 357.h),
              Image.asset(AppImages.shadhinwifiLogo, width: 357.w, height: 200.h),
              Text('স্বাধীন নেটওয়ার্কে \nস্বাগতম',style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w600,fontSize: 28),textAlign: TextAlign.center,),
              //=============================> GET STARTED Button <========================
              SizedBox(height: 20.h),
              CustomButton(
                  onTap: () {
                     Get.toNamed(AppRoutes.signInScreen);
                  },
                  text: 'GET STARTED'),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
