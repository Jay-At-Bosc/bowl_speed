import 'package:get/get.dart';

import '../controllers/unit_conversion_controller.dart';

class UnitConversionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UnitConversionController>(UnitConversionController());
  }
}