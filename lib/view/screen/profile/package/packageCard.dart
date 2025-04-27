import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/style.dart';

class PackageCard extends StatelessWidget {
  final String planName;
  final String data;
  final String validity;
  final String price;
  final VoidCallback onPressed;

  const PackageCard({
    Key? key,
    required this.planName,
    required this.data,
    required this.validity,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                planName,
                style: AppStyles.fontSize12(color: AppColors.blackColor)
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            data,
            style: AppStyles.fontSize24(fontWeight: FontWeight.bold,color: AppColors.blackColor),
          ),
           SizedBox(height: 4.h),
          Text(
            validity,
            style: AppStyles.fontSize14(color: AppColors.greyColor),
          ),
          SizedBox(height: 4.h),
          Text(
            price,
            style: AppStyles.fontSize16(fontWeight: FontWeight.bold,color: AppColors.redColor),
          ),
           SizedBox(height: 8.h),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),

            ),
            child:  Text(
              'Buy Now',style: AppStyles.fontSize16(color: AppColors.white,fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
