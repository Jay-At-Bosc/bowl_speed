// ignore_for_file: prefer_const_constructors

//import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/home/home.dart';
// import 'services/controllers/manual_calc_controller.dart';

// import 'services/controllers/menu_feature_controller.dart';

// import 'services/controllers/quick_tap_controller.dart';
// import 'services/controllers/unit_conversion_controller.dart';
// import 'services/controllers/settings_controller.dart';

// import 'services/controllers/video_measure_controller.dart';
import 'services/bindings/global_binding.dart';
import 'services/routes/app_pages.dart';
import 'services/routes/app_routes.dart';
import 'utils/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await DatabaseHelper.instance.database; // Ensure database is initialized
  // Get.put<MenuFeatureController>(MenuFeatureController());
  // Get.put<ManualCalculatorController>(ManualCalculatorController());
  // Get.put<UnitConversionController>(UnitConversionController());
  // Get.put<SettingsController>(SettingsController());

  // Get.put<BowlerController>(BowlerController());
  // Get.put<QuickTapController>(QuickTapController());
  // Get.put<VideoMeasureController>(VideoMeasureController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bowl Speed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: GlobalBinding(),
      initialRoute: AppPages.initial,
      home: HomeScreen(),
      getPages: AppPages.routes,
    );
  }
}
