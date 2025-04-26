import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';


class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  bool isTesting = false;
  double downloadSpeed = 0.0;
  double uploadSpeed = 0.0;
  int ping = 0;

  void startTesting() {
    setState(() {
      isTesting = true;
      downloadSpeed = 58.72;
      uploadSpeed = 19.45;
      ping = 32;
    });
  }

  void stopTesting() {
    setState(() {
      isTesting = false;
      downloadSpeed = 0.0;
      uploadSpeed = 0.0;
      ping = 0;
    });
  }

  Widget _buildSpeedTile({required IconData icon, required String title, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.primaryColor.withOpacity(0.05),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 28.w),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.fontSize14(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: AppStyles.fontSize18(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: UserBottomMenu(2),
      appBar: AppBar(
        title: Text(
          'Network',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),

              // Big Speed Circle
              Container(
                height: 200.h,
                width: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(0.1),
                  border: Border.all(color: AppColors.primaryColor, width: 4),
                ),
                child: Center(
                  child: Text(
                    '${downloadSpeed.toStringAsFixed(2)} Mbps',
                    style: AppStyles.fontSize24(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Speed Details
              _buildSpeedTile(
                icon: Icons.download_rounded,
                title: 'Download Speed',
                value: '${downloadSpeed.toStringAsFixed(2)} Mbps',
              ),
              _buildSpeedTile(
                icon: Icons.upload_rounded,
                title: 'Upload Speed',
                value: '${uploadSpeed.toStringAsFixed(2)} Mbps',
              ),
              _buildSpeedTile(
                icon: Icons.network_ping_rounded,
                title: 'Ping',
                value: '$ping ms',
              ),

              SizedBox(height: 20.h),

              // Start/Stop Button
              ElevatedButton(
                onPressed: () {
                  isTesting ? stopTesting() : startTesting();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  isTesting ? 'Stop Testing' : 'Start Testing',
                  style: AppStyles.fontSize16(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
