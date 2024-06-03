import 'package:bowl_speed/pages/quick_tap_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/Pages/manual%20calculator/manual_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/controllers/manual_calc_controller.dart';
import 'utils/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database; // Ensure database is initialized
  Get.put<ManualCalculatorController>(ManualCalculatorController());
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
      home: const QuickTapScreen(),

    );
  }
}
