import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wifi_service_app/base/custom_button.dart';
import 'package:wifi_service_app/base/custom_text_field.dart';
import 'package:wifi_service_app/helpers/route.dart';
import 'package:wifi_service_app/utils/app_colors.dart';
import 'package:wifi_service_app/utils/app_icons.dart';
import 'package:wifi_service_app/utils/style.dart';

class PersonalizeQuestionScreenOne extends StatefulWidget {
  PersonalizeQuestionScreenOne({super.key});

  @override
  State<PersonalizeQuestionScreenOne> createState() => _PersonalizeQuestionScreenOneState();
}

class _PersonalizeQuestionScreenOneState extends State<PersonalizeQuestionScreenOne> {
  // Initialize controllers for text fields
  TextEditingController textController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  // To manage unit selections
  bool isLbsSelected = false;
  bool isInchesSelected = false;

  // Default selected date
  DateTime selectedDate = DateTime.now();

  // Function to show date picker for the birthdate
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        textController.text = "${selectedDate.toLocal()}".split(' ')[0];  // Update text field with selected date
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    textController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personalize Journey 🧡', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Date of Birth Question
              Text('What’s your date of birth?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Text('This helps us understand your fertility stage.', style: AppStyles.fontSize14(fontWeight: FontWeight.w500, color: AppColors.subTextColor)),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Select date',
                      controller: textController,
                      readOnly: true,
                      suffixIcons: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.calenderblackColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '${DateTime.now().year - selectedDate.year} Years',
                    style: AppStyles.fontSize24(fontWeight: FontWeight.w500, color: AppColors.subTextColor),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              // Height Question
              Text('What is your height?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Text('You can enter in feet/inches or cm.', style: AppStyles.fontSize14(fontWeight: FontWeight.w500, color: AppColors.subTextColor)),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Enter your height',
                      controller: heightController,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.colorD1D1D1,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isInchesSelected = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: isInchesSelected ? AppColors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text('Inches', style: AppStyles.fontSize24(fontWeight: FontWeight.w500, color: AppColors.blackColor)),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isInchesSelected = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: isInchesSelected ? Colors.transparent : AppColors.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text('Cm', style: AppStyles.fontSize24(fontWeight: FontWeight.w500, color: AppColors.blackColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              // Weight Question
              Text('What is your weight?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Text('Lbs or kg – no judgment, just insights!', style: AppStyles.fontSize14(fontWeight: FontWeight.w500, color: AppColors.subTextColor)),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Enter your weight',
                      controller: weightController,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.colorD1D1D1,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLbsSelected = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: isLbsSelected ? AppColors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text('Lbs', style: AppStyles.fontSize24(fontWeight: FontWeight.w500, color: AppColors.blackColor)),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLbsSelected = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: isLbsSelected ? Colors.transparent : AppColors.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text('kg', style: AppStyles.fontSize24(fontWeight: FontWeight.w500, color: AppColors.blackColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.personalizeQuestionScreenTwo);
                  },
                  text: 'Next',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  color: AppColors.white,
                  borderColor: AppColors.white,
                  onTap: () {
                    //Get.toNamed(AppRoutes.personalizeQuestionScreenTwo);
                  },
                  text: 'Back',
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
