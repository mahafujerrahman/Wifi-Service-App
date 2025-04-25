import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wifi_service_app/base/custom_text.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  TextEditingController textEditingController = TextEditingController();

  final notifications = [
    {
      'title': 'Set your cycle Insights for today',
      'date': 'January 14, 2025',
      'description': 'Remainder',
      'notificationType': 'Reminder',
    },
    {
      'title': 'Today is 2nd of your ovulation time',
      'date': 'January 15, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
    {
      'title': 'Set your cycle Insights for today',
      'date': 'January 14, 2025',
      'description': 'Remainder',
      'notificationType': 'Reminder',
    },
    {
      'title': 'Ovulation Day start from today',
      'date': 'January 14, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
    {
      'title': '⚡Vert High Chance for Pregnancy',
      'date': 'January 14, 2025',
      'description': 'Ovulation Day',
      'notificationType': 'Pregnancy',
    },
    {
      'title': 'Today is 2nd of your ovulation time',
      'date': 'January 15, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
    {
      'title': 'Period Day start from today',
      'date': 'January 1, 2025',
      'description': 'You set your period length 5 days, you can change it from profile > Period and Cycle settings.',
      'notificationType': 'Period',
    },
    {
      'title': 'Today is 2nd of your ovulation time',
      'date': 'January 15, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
  ];

  Color getNotificationBackgroundColor(String notificationType) {
    switch (notificationType) {
      case 'Reminder':
        return Color(0xFFFAEBE0);
      case 'Ovulation':
        return Color(0xFFFFFFFF);
      case 'Pregnancy':
        return Color(0xFFE6EEF3);
      case 'Period':
        return Color(0xFFFAEBE0);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: UserBottomMenu(2),
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
              },
              child: CustomText(
                text: "Make all read",
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                Color backgroundColor = getNotificationBackgroundColor(notification['notificationType']!);

                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification['title']!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        notification['date']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        notification['description']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}
