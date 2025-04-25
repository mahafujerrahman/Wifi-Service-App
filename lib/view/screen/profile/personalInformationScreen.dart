import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wifi_service_app/base/custom_list_tile.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';
import 'package:wifi_service_app/utils/app_strings.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';


class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const UserBottomMenu(3),
      appBar: AppBar(
        title: Text('Personal Information',
          style: AppStyles.fontSize18(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height :102.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.r))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)), // Removed .r for simplicity
                              ),
                              child: Image.network(
                                'http://www.clker.com/cliparts/Z/J/g/U/V/b/avatar-male-silhouette-md.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: 'rahman munna',color: Colors.white,fontSize:24.sp ,),
                                CustomText(text: 'rahmanmunna@gmail.com',color: Colors.white,fontSize:14.sp),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(AppRoutes.editPersonalInformationScreen);
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppIcons.eyeOffIcon)
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),
                    //============================> PersonalInfo List Tile <=================
                    CustomListTile(
                      title:'Mahafujer Rahman',
                      prefixIcon: SvgPicture.asset(AppIcons.eyeIcon,color: AppColors.borderColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Chat History List Tile <=================
                    CustomListTile(
                      title:'mahafujer@gmail.com',
                      prefixIcon: SvgPicture.asset(AppIcons.eyeOffIcon,color: AppColors.borderColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Settings List Tile <=================
                    CustomListTile(
                      onTap: () {
                        //  Get.toNamed(AppRoutes.forgotPasswordScreen);
                      },
                      title:'+0175588888888',
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon,color: AppColors.borderColor,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Birth day List Tile <=================
                    CustomListTile(
                      title:'12 July 1998',
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon,height: 20.h,width: 20.w),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Address List Tile <=================
                    CustomListTile(
                      title:'Dhaka Bangladesh',
                      prefixIcon: SvgPicture.asset(AppIcons.profileIcon,height: 20.h,width: 20.w),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}