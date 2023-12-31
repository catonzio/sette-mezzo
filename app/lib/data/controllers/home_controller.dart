import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxDouble _percentage = 0.7.obs;
  double get percentage => _percentage.value;
  set percentage(double value) => _percentage.value = value;

  final RxBool _isStatisticsOpen = true.obs;
  bool get isStatisticsOpen => _isStatisticsOpen.value;
  set isStatisticsOpen(bool value) => _isStatisticsOpen.value = value;

  void changePercentage(double value) {
    percentage = clampDouble(value, 0.2, 0.8);
  }

  void toggleStatistics() {
    isStatisticsOpen = !isStatisticsOpen;
    percentage = isStatisticsOpen ? 0.7 : 1;
  }
}
