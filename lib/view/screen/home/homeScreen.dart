import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wifi_service_app/base/custom_button.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(0),
      appBar: AppBar(
        title: Text(
          'Home',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              Text('Welcome Back!', style: AppStyles.fontSize20(fontWeight: FontWeight.bold)),
              SizedBox(height: 4.h),
              Text('Your Internet Dashboard', style: AppStyles.fontSize16(color: AppColors.subTextColor)),

              SizedBox(height: 20.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Internet Status', style: AppStyles.fontSize16(color: Colors.white)),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Connected', style: AppStyles.fontSize20(fontWeight: FontWeight.bold, color: Colors.white)),
                        Icon(Icons.wifi, color: Colors.white, size: 32.w),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.colorE0DCD2,
                  border: Border.all(width: 1.w, color: AppColors.subTextColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Plan', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.h),
                    Text('Unlimited 100 Mbps', style: AppStyles.fontSize18(fontWeight: FontWeight.w600)),
                    SizedBox(height: 8.h),
                    Text('Expiry: 30th July 2025', style: AppStyles.fontSize14(color: AppColors.subTextColor)),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.w, color: AppColors.subTextColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.data_usage, color: AppColors.primaryColor, size: 32.w),
                          SizedBox(height: 8.h),
                          Text('Data Used', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                          SizedBox(height: 4.h),
                          Text('2.5 GB', style: AppStyles.fontSize16()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.w, color: AppColors.subTextColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.access_time, color: AppColors.primaryColor, size: 32.w),
                          SizedBox(height: 8.h),
                          Text('Usage Time', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                          SizedBox(height: 4.h),
                          Text('5h 20m', style: AppStyles.fontSize16()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              CustomButton(
                text: 'Upgrade Plan',
                onTap: () {
                  Get.toNamed(AppRoutes.activePackageDetails);
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
