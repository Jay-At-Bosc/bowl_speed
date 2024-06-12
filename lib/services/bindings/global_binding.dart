import 'package:bowl_speed/imports_manager.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuFeatureController>(MenuFeatureController());
    Get.put<BowlerController>(BowlerController());
    Get.put<QuickTapController>(QuickTapController());
    Get.put<VideoMeasureController>(VideoMeasureController());
    Get.put<SettingsController>(SettingsController());
  }
}
