import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wifi_service_app/base/custom_list_tile.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
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
                              width: 80.w,
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
                                CustomText(text: 'rahman munna',color: Colors.black,fontSize:24.sp ,),
                                CustomText(text: 'rahmanmunna@gmail.com',color: Colors.black,fontSize:14.sp),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(AppRoutes.editPersonalInformationScreen);
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.edit)
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),
                    //============================> PersonalInfo List Tile <=================
                    CustomListTile(
                      title:'Mahafujer Rahman',
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Chat History List Tile <=================
                    CustomListTile(
                      title:'mahafujer@gmail.com',
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Settings List Tile <=================
                    CustomListTile(
                      onTap: () {
                        //  Get.toNamed(AppRoutes.forgotPasswordScreen);
                      },
                      title:'+0175588888888',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    SizedBox(height: 8.h),
                    //============================> Address List Tile <=================
                    CustomListTile(
                      title:'Dhaka Bangladesh',
                      prefixIcon:  Icon(Icons.location_city),
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