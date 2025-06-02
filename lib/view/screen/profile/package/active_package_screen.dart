import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:wifi_service_app/view/screen/profile/package/packageCard.dart';

class ActivePackageDetails extends StatefulWidget {
  const ActivePackageDetails({super.key});

  @override
  State<ActivePackageDetails> createState() => _ActivePackageDetailsState();
}

class _ActivePackageDetailsState extends State<ActivePackageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Active Package Details',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 102.h,
                decoration: BoxDecoration(
                  color: AppColors.secondColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Active Package : Plan 1',
                            style: AppStyles.fontSize24(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Validation : July 30, 2025',
                            style: AppStyles.fontSize16(
                                color: AppColors.blackColor),
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Other Packages',
                style: AppStyles.fontSize16(
                    color: AppColors.blackColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),

              /// 🛠 Responsive GridView here
              LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  int crossAxisCount = 2;

                  if (screenWidth >= 600) {
                    crossAxisCount = 3; // Tablet
                  } else if (screenWidth >= 900) {
                    crossAxisCount = 4; // Large Tablet / Web
                  }

                  double itemWidth = (screenWidth - (crossAxisCount - 1) * 12.w) / crossAxisCount;
                  double itemHeight = 220.h; // PackageCard height approx

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: itemWidth / itemHeight, // 🔥 Dynamically responsive
                    ),
                    itemBuilder: (context, index) {
                      return PackageCard(
                        planName: 'Plan ${index + 1}',
                        data: '${100 * (index + 1)} Mbps',
                        validity: '30 Days',
                        price: 'BDT ${10000 + (index * 5000)}',
                        onPressed: () {
                          // Handle button tap
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
