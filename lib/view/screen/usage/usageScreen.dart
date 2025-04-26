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
  final ValueNotifier<bool> isMonthly = ValueNotifier<bool>(true);

  final List<OrdinalData> ordinalList = [
    OrdinalData(domain: 'Jan', measure: 3),
    OrdinalData(domain: 'Feb', measure: 5),
    OrdinalData(domain: 'Mar', measure: 9),
    OrdinalData(domain: 'Apr', measure: 6.5),
    OrdinalData(domain: 'May', measure: 5.5),
  ];

  @override
  Widget build(BuildContext context) {
    final ordinalGroup = [
      OrdinalGroup(id: '1', chartType: ChartType.bar, data: ordinalList,color: AppColors.popUpColor),
      OrdinalGroup(id: '2', chartType: ChartType.line, data: ordinalList),
      OrdinalGroup(id: '3', chartType: ChartType.scatterPlot, data: ordinalList),
    ];

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
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2.h),
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
                  padding:  EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => isMonthly.value = true,
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: isMonthly,
                                  builder: (context, value, _) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: value ? AppColors.secondatyColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Month',
                                        style: TextStyle(
                                          color: value ? Colors.white : Colors.blue,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => isMonthly.value = false,
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: isMonthly,
                                  builder: (context, value, _) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: !value ? AppColors.secondatyColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Year',
                                        style: TextStyle(
                                          color: !value ? Colors.white : Colors.blue,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding:  EdgeInsets.all(16.r),
                        child: Container(
                          height: 450.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: DChartComboO(
                              groupList: ordinalGroup,
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
                                  } else if (value <= 100) {
                                    return '100 Mbps';
                                  } else if (value <= 200) {
                                    return '200 Mbps';
                                  } else if (value <= 300) {
                                    return '300 Mbps';
                                  } else {
                                    return ''; // hide other values if you want
                                  }
                                },
                              ),

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
