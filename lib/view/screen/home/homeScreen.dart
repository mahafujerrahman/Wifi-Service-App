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
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(onTap: (){

              }, text: "Personalize Journey 🧡"),
              SizedBox(height: 10.h),
              Text('Today\'s Rundown :',style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.colorE0DCD2,
                    border: Border.all(width: 1.w, color: AppColors.subTextColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phase'),
                            Text('Menstrual',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phase'),
                            Text('Very Low',
                                style: AppStyles.fontSize16(
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline)
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cycle Day'),
                            Text('4',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
