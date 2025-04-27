import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: Text('Contact Us',
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
              Text('For support or inquiries, please contact us at support@wifiserviceapp.com. Our team is available 24/7 to assist with technical issues, account questions, or general feedback. You can also reach us via our hotline at +880-1234-567890. We’re committed to ensuring your best experience.',
                textAlign: TextAlign.justify,)
            ],
          ),
        ),
      ),
    );
  }
}
