import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wifi_service_app/base/custom_list_tile.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOn = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(3),
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title: Text(
          'Profile',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.r),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mahafujer Rahman', style: AppStyles.fontSize20(fontWeight: FontWeight.w900)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Network Status :', style: AppStyles.fontSize16(color: AppColors.subTextColor)),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isOn = !isOn;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: isOn ? Colors.green : AppColors.redColor,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Center(
                            child: Text(
                              isOn ? 'Connected' : 'Disconnected',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text('Account Type : Free', style: AppStyles.fontSize16(color: AppColors.subTextColor)),
                ],
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h,vertical: 4.w),
                child: Column(
                  children: [
                    CustomListTile(
                      prefixIcon: SvgPicture.asset(AppIcons.personalInfoIcon),
                      suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                      onTap: (){
                        Get.toNamed(AppRoutes.personalInformationScreen);
                      },
                      title: 'Personal Information'),
                    SizedBox(height: 4.h),
                    CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.updateAccountIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: (){
                          Get.toNamed(AppRoutes.activePackageDetails);
                        },
                        title: 'Active Package Details'),
                    SizedBox(height: 4.h),
                    CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: (){
                          Get.toNamed(AppRoutes.resetPasswordScreen);
                        },
                        title: 'Change Password'),
                    SizedBox(height: 4.h),
                    CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.helpIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: (){
                          Get.toNamed(AppRoutes.helpScreen);
                        },
                        title: 'Help'),
                    SizedBox(height: 4.h),
                    CustomListTile(
                        prefixIcon: Icon(Icons.policy),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: (){
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        },
                        title: 'Privacy and Policy'),
                    SizedBox(height: 4.h),
                    CustomListTile(
                        prefixIcon: Icon(Icons.comment),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: (){
                          Get.toNamed(AppRoutes.contactUsScreen);
                        },
                        title: 'Contact Us'),
                    SizedBox(height: 4.h),
                    CustomListTile(
                        prefixIcon: Icon(Icons.logout,color: Colors.red),
                        onTap: (){
                          _showLogOutBottomSheet(context);
                        },
                        title: 'Log Out'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //=========================>>>>>  Log out Custom BottomSheet    <<<================================
  void _showLogOutBottomSheet(BuildContext context) {
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
          height: 265.h,
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
              Text('Logout', style: AppStyles.fontSize24(color: AppColors.primaryColor,fontWeight: FontWeight.w600),),
              SizedBox(height: 14.h),
              Text('Are you sure?',
                style: AppStyles.fontSize18(color: AppColors.primaryColor),
              ),
               SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 58),
                        backgroundColor:  AppColors.fillColor,
                        side: BorderSide(
                            width: 1,
                            color: AppColors.greyColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text('Cancel',
                        style: AppStyles.fontSize18(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async{
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 58),
                        backgroundColor: AppColors.redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text('Yes',
                        style:  AppStyles.fontSize18(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
