import 'package:bowl_speed/imports_manager.dart';


class ManualCalcBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ManualCalculatorController>(ManualCalculatorController());
  }
}