import 'package:bowl_speed/imports_manager.dart';


class UnitConversionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UnitConversionController>(UnitConversionController());
  }
}