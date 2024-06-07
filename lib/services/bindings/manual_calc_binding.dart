import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:get/get.dart';

class ManualCalcBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ManualCalculatorController>(ManualCalculatorController());
  }
}