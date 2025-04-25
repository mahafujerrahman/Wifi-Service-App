// import 'dart:async';
// import 'dart:math';
// import 'package:get/get.dart';
//
// class WifiUsageController extends GetxController {
//   final RxList<double> usageData = <double>[].obs;
//   final int maxPoints = 20;
//   late Timer _timer;
//   final Random _random = Random();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _startUpdatingData();
//   }
//
//   void _startUpdatingData() {
//     _timer = Timer.periodic(Duration(seconds: 1), (_) {
//       final newUsage = _generateRandomUsage(5, 25); // Simulated value between 5-25 Mbps
//       if (usageData.length >= maxPoints) {
//         usageData.removeAt(0);
//       }
//       usageData.add(newUsage);
//     });
//   }
//
//   double _generateRandomUsage(double min, double max) {
//     return min + _random.nextDouble() * (max - min);
//   }
//
//   @override
//   void onClose() {
//     _timer.cancel();
//     super.onClose();
//   }
// }
