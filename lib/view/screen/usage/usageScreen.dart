import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/style.dart';
import 'package:d_chart/ordinal/combo.dart';
import 'package:d_chart/commons/axis/axis.dart';
import 'package:d_chart/commons/data_model/data_model.dart';
import 'package:d_chart/commons/enums.dart';
import 'package:d_chart/commons/style/style.dart';
import 'package:wifi_service_app/view/screen/bottomMenuBar/user_bottom_menu..dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({super.key});

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  final ValueNotifier<bool> isDaily = ValueNotifier<bool>(true);

  final List<OrdinalData> dailyData = [
    OrdinalData(domain: 'Fri', measure: 700),
    OrdinalData(domain: 'Sat', measure: 350),
    OrdinalData(domain: 'Sun', measure: 600),
    OrdinalData(domain: 'Mon', measure: 450),
    OrdinalData(domain: 'Tue', measure: 310),
    OrdinalData(domain: 'Wed', measure: 350),
    OrdinalData(domain: 'Thu', measure: 500),
  ];

  final List<OrdinalData> monthlyData = [
    OrdinalData(domain: '1', measure: 550),
    OrdinalData(domain: '2', measure: 120),
    OrdinalData(domain: '3', measure: 780),
    OrdinalData(domain: '4', measure: 200),
    OrdinalData(domain: '5', measure: 550),
    OrdinalData(domain: '6', measure: 670),
    OrdinalData(domain: '7', measure: 300),
    OrdinalData(domain: '8', measure: 720),
    OrdinalData(domain: '9', measure: 350),
    OrdinalData(domain: '10', measure: 400),
    OrdinalData(domain: '11', measure: 420),
    OrdinalData(domain: '12', measure: 450),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(1),
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title: Text(
          'Usage Summary',
          style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColors.colorF7D6D1,
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Icon(Icons.analytics_outlined),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          'Check your bandwidth usage summary at a glance.',
                          style: AppStyles.fontSize14(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Divider(thickness: .5),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: isDaily,
                        builder: (context, isDailySelected, _) {
                          return Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => isDaily.value = true,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isDailySelected ? AppColors.secondatyColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Daily',
                                        style: TextStyle(
                                          color: isDailySelected ? Colors.white : Colors.black,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => isDaily.value = false,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: !isDailySelected ? AppColors.secondatyColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Monthly',
                                        style: TextStyle(
                                          color: !isDailySelected ? Colors.white : Colors.black,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Container(
                          height: 450.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ValueListenableBuilder<bool>(
                              valueListenable: isDaily,
                              builder: (context, isDailySelected, _) {
                                final groupList = [
                                  OrdinalGroup(
                                    id: '1',
                                    chartType: ChartType.bar,
                                    data: isDailySelected ? dailyData : monthlyData,
                                    color: AppColors.popUpColor,
                                  ),
                                  OrdinalGroup(
                                    id: '2',
                                    chartType: ChartType.line,
                                    data: isDailySelected ? dailyData : monthlyData,
                                  ),
                                  OrdinalGroup(
                                    id: '3',
                                    chartType: ChartType.scatterPlot,
                                    data: isDailySelected ? dailyData : monthlyData,
                                  ),
                                ];
                                return DChartComboO(
                                  groupList: groupList,
                                  domainAxis: DomainAxis(),
                                  measureAxis: MeasureAxis(
                                    showLine: true,
                                    lineStyle: LineStyle(color: Colors.black),
                                    labelStyle: LabelStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    gapAxisToLabel: 8,
                                    labelAnchor: LabelAnchor.centered,
                                    tickLength: 5,
                                    tickLabelFormatter: (value) {
                                      if (value == null) return '';
                                      if (value <= 0) {
                                        return '0 Mbps';
                                      } else if (value <= 300) {
                                        return '300 Mbps';
                                      } else if (value <= 400) {
                                        return '400 Mbps';
                                      } else if (value <= 500) {
                                        return '500+ Mbps';
                                      } else {
                                        return '';
                                      }
                                    },

                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
