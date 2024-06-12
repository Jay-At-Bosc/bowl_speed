import 'package:bowl_speed/imports_manager.dart';


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
