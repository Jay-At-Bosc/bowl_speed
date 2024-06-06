// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'pages/home/home.dart';
import 'services/controllers/manual_calc_controller.dart';

import 'services/controllers/menu_feature_controller.dart';

import 'services/controllers/unit_conversion_controller.dart';
import 'services/controllers/settings_controller.dart';
import 'utils/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database; // Ensure database is initialized
  Get.put<MenuFeatureController>(MenuFeatureController());
  Get.put<ManualCalculatorController>(ManualCalculatorController());
  Get.put<UnitConversionController>(UnitConversionController());
  Get.put<SettingsController>(SettingsController());
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
      home: HomeScreen(),
    );
  }
}
