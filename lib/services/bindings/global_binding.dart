import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:bowl_speed/services/controllers/menu_feature_controller.dart';
import 'package:bowl_speed/services/controllers/video_measure_controller.dart';
import 'package:get/get.dart';

import '../controllers/quick_tap_controller.dart';
import '../controllers/settings_controller.dart';

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
