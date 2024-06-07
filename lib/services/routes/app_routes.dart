import 'package:bowl_speed/Pages/home/home.dart';

import 'package:bowl_speed/Pages/quick_tap/quick_tap_history.dart';
import 'package:bowl_speed/Pages/quick_tap/quick_tap_screen.dart';
import 'package:bowl_speed/services/bindings/global_binding.dart';
import 'package:bowl_speed/services/bindings/manual_calc_binding.dart';
import 'package:bowl_speed/services/bindings/unit_conversion_binding.dart';
import 'package:bowl_speed/utils/constants.dart';
import 'package:get/get.dart';

import '../../Pages/bowler/add_bowler_details.dart';
import '../../Pages/bowler/bowler_detail.dart';

import '../../Pages/how_to_use/how_to_use_screen.dart';
import '../../Pages/manual_calculator/manual_calculator_screen.dart';
import '../../Pages/settings/settings_screen.dart';

import '../../Pages/unit_conversion/unit_conversion_screen.dart';
import '../../Pages/video_measure/player.dart';
import '../../pages/bowler/bowler_report.dart';
import '../../pages/manual_calculator/manual_calc_history.dart';
import '../../widgets/privacy_policy.dart';
import 'app_pages.dart';

class AppPages {
  static get initial => Routes.home;
  static void get back => Get.back();

  static final routes = [
    // GetPage(name: Routes.splash, page: () => const SplashPage()),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: GlobalBinding(),
    ),

    GetPage(
      name: Routes.quickTapCalcHistory,
      page: () => const QuickTapHistoryScreen(),
      transition: Constants.rightToleft,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.privacyPolicy,
      page: () => const PrivacyPolicy(),
      transition: Constants.bottomToup,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.bowlerDetails,
      page: () => const BowlerDetailScreen(),
      transition: Constants.leftToright,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.addBowlerDetails,
      page: () => const AddBowlerDetails(),
      transition: Constants.bottomToup,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.quickTapCalc,
      page: () => const QuickTapScreen(),
      transition: Constants.leftToright,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.videoMeasure,
      page: () => const Player(),
      transition: Transition.rightToLeft,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.bowlerReport,
      page: () => const BowlerReportScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      transition: Constants.bottomToup,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.howToUse,
      page: () => const HowToUseScreen(),
      transition: Constants.bottomToup,
      transitionDuration: Constants.transitionDuration,
    ),

    GetPage(
      name: Routes.manualCalculator,
      page: () => const ManualCalculatorScreen(),
      binding: ManualCalcBinding(),
      transition: Constants.bottomToup,
      transitionDuration: Constants.transitionDuration,
    ),
    GetPage(
      name: Routes.manualCalcHistory,
      page: () => const ManualCalcHistory(),
      transition: Constants.rightToleft,
      transitionDuration: Constants.transitionDuration,
    ),
    GetPage(
      name: Routes.unitConversion,
      page: () => const UnitConversionScreen(),
      binding: UnitConversionBinding(),
      transition: Constants.bottomToup,
      transitionDuration: Constants.transitionDuration,
    ),
  ];
}
