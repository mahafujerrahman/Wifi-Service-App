import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';


class UserBottomMenu extends StatelessWidget {
  final int menuIndex;
  const UserBottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.white : AppColors.blackColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding:  EdgeInsets.only(top: 4.h),
          child: SvgPicture.asset(
            image,
            height: 24.h,
            width: 24.w,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(menuIndex == 0 ? AppIcons.homeFillupIcon : AppIcons.homeIcon, 'Home', theme, 0),
      getItem(menuIndex == 1 ? AppIcons.usageIconFillUp : AppIcons.usageIcon,'Usage', theme, 1),
      getItem(menuIndex == 2 ? AppIcons.networkIconFillup : AppIcons.networkIcon, 'Network', theme, 2),
      getItem(menuIndex == 3 ? AppIcons.profileFillup : AppIcons.profileIcon, 'Profile', theme, 3),
    ];

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(0, -.05),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.white,
        currentIndex: menuIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Get.offAndToNamed(AppRoutes.homeScreen);
              break;
            case 1:
              Get.offAndToNamed(AppRoutes.usageScreen);
              break;
            case 2:
              Get.offAndToNamed(AppRoutes.networkScreen);
              break;
            case 3:
              Get.offAndToNamed(AppRoutes.profileScreen);
              break;

          }
        },
        items: menuItems,
      ),
    );


  }
}

