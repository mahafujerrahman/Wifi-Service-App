import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({super.key});

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  TextEditingController textEditingController = TextEditingController();


  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime.utc(2025, 4, 5): ['ovulation'],
      DateTime.utc(2025, 4, 10): ['today'],

    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(1),
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title:  Text('Calendar',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColors.colorF7D6D1,
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4,vertical: 2.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.touchIcon),
                        SizedBox(width: 4.w),
                        Text('Tap on the date to view or edit your cycle insights.',style: AppStyles.fontSize14()),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                child: Divider(thickness: .5),
              ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('hi')
              
                
                ],
              ),
            ),

            ],
          ),
        ),
      ),

    );
  }
}
