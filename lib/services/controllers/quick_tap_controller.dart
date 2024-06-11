import 'dart:async';
import 'dart:developer';

import 'package:bowl_speed/services/controllers/settings_controller.dart';
import 'package:bowl_speed/services/models/quick_tap_model.dart';
import 'package:bowl_speed/utils/db_helper.dart';
import 'package:bowl_speed/utils/formate_functions.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../../pages/manual_calculator/custom_result_dialogue.dart';
import '../models/bowler_report_model.dart';

class QuickTapController extends GetxController {
  static QuickTapController get instance => Get.find();

  static String get timerId => "timerId";
  static String get speedId => "speedId";
  static String get durationId => "durationId";
  bool isTimerOn = false;

  //TextEditingController
  TextEditingController meterTextController =
      TextEditingController(text: "20.0");

  String formattedTime = '00:00:00';
  String speed = "--";
  String selectedBowler = "";
  int _milliseconds = 0;
  Timer? _timer;
  double distance = 20.0;
  double speedInKmph = 0.0;
  double speedInMph = 0.0;
  late List<QuickTapModel> historyList;
  List<QuickTapModel> filterHistoryList = <QuickTapModel>[];
  List<BowlerReport> bowlerReports = <BowlerReport>[];
  List<BowlerReport> filterList = <BowlerReport>[];

  final CountDownController countDownController = CountDownController();

  // @override
  // void onInit() async {
  //   super.onInit();
  //   // generateBowlerReports();
  // }

  void selectBowler(String value) {
    selectedBowler = value;
    update(['bowler']);
  }

  void startTimer() {
    isTimerOn = true;
    speed = "00.0 km/h - 00.0 mph";
    formattedTime = "00:00:00";

    update([speedId]);
    countDownController.start();

    _milliseconds = 0;
    formattedTime = formatTime(_milliseconds);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _milliseconds += 3;

      formattedTime = formatTime(_milliseconds);

      update([durationId]);
    });

    update([timerId]);
  }

  String formatTime(int milliseconds) {
    int hours = (milliseconds ~/ (1000 * 60 * 60)) % 24;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    int seconds = (milliseconds ~/ 1000) % 60;
    int millis = milliseconds % 1000;
    return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}:${_fourDigits(millis)}';
  }

  String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String _fourDigits(int n) {
    return n.toString().padLeft(4, '0');
  }

  void stopTimer() {
    isTimerOn = false;
    _timer?.cancel();
    countDownController.pause();

    showResult();
    update([timerId]);
  }

  void showResult() {
    calculateSpeed();
    var result =
        "${speedInKmph.toStringAsFixed(1)} km/h - ${speedInMph.toStringAsFixed(1)} mph";
    customResultDialogue(
      'Result',
      result,
      () async {
        QuickTapModel model = QuickTapModel(
            bowler: selectedBowler,
            distance: distance,
            time: formattedTime,
            kmh: speedInKmph,
            mps: speedInMph,
            measurementType: "Quick Tap",
            date: formatDateTime(DateTime.now()));
        await DatabaseHelper.instance.insertQuickTapCalculator(model);
        Get.back();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text("Saved")),
        );
      },
    );
    // Get.defaultDialog(
    //   titleStyle: GoogleFonts.rubik(fontSize: 18),
    //   middleTextStyle: GoogleFonts.rubik(fontSize: 14),
    //   barrierDismissible: false,
    //   title: "Result",
    //   middleText:
    //       "${speedInKmph.toStringAsFixed(1)} km/h - ${speedInMph.toStringAsFixed(1)} mph",
    //   confirm: ElevatedButton(
    //     onPressed: () async {

    //     },
    //     style: ElevatedButton.styleFrom(
    //       foregroundColor: AppColors.textWhiteColor,
    //       backgroundColor: AppColors.primaryColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     child: const Text("Save"),
    //   ),
    //   cancel: ElevatedButton(
    //     onPressed: () {
    //       Get.back();
    //       countDownController.reset();
    //       update([durationId, timerId]);
    //     },
    //     style: ElevatedButton.styleFrom(
    //       foregroundColor: AppColors.textDarkColor,
    //       backgroundColor: AppColors.textWhiteColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     child: const Text("Cancel"),
    //   ),
    // );
  }

  void calculateSpeed() {
    double distanceInKilometers = distance / 1000.0;

    double timeInHours = _milliseconds / (1000.0 * 60 * 60);
    // if (timeInHours == 0) {
    //   throw ArgumentError("Time cannot be zero");
    // }
    speedInKmph = distanceInKilometers / timeInHours;
    speedInMph = speedInKmph * 0.621371;
    speed =
        "${speedInKmph.toStringAsFixed(1)} km/h - ${speedInMph.toStringAsFixed(1)} mph";
    update([speedId]);
  }

  void changeDistance() async {
    // Get.defaultDialog(
    //   title: "Change Pitch Meter",
    //   titleStyle: GoogleFonts.rubik(fontSize: 18),
    //   titlePadding: const EdgeInsets.all(16.0),
    //   barrierDismissible: false,
    //   content: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //     child: TextFormField(
    //       controller: meterTextController,
    //       // initialValue: "20.0",
    //       keyboardType: TextInputType.number,
    //       maxLength: 5,
    //       decoration: InputDecoration(
    //         border: const OutlineInputBorder(
    //             borderSide: BorderSide(color: Colors.transparent)),
    //         filled: true,
    //         label: const Text("Enter Meter"),
    //         labelStyle: GoogleFonts.rubik(color: AppColors.primaryColor),
    //         focusedBorder: const OutlineInputBorder(
    //           borderSide: BorderSide(color: AppColors.primaryColor),
    //         ),
    //         fillColor: AppColors.containerColor,
    //       ),
    //       validator: (value) {
    //         if (value!.isEmpty) {
    //           return "Please Enter something";
    //         }
    //         return null;
    //       },
    //     ),
    //   ),
    //   cancel: ElevatedButton.icon(
    //     onPressed: () {
    //       Get.back();
    //       countDownController.reset();
    //       update([durationId, timerId]);
    //     },
    //     style: ElevatedButton.styleFrom(
    //       foregroundColor: AppColors.textDarkColor,
    //       backgroundColor: AppColors.containerColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     icon: const Icon(Iconsax.close_circle),
    //     label: const Text("Cancel"),
    //   ),
    //   confirm: ElevatedButton.icon(
    //     onPressed: () {
    //       distance = double.parse(meterTextController.text);
    //       Get.back();
    //       countDownController.reset();
    //       update([durationId, timerId]);
    //     },
    //     style: ElevatedButton.styleFrom(
    //       foregroundColor: AppColors.textWhiteColor,
    //       backgroundColor: AppColors.primaryColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     icon: const Icon(
    //       Iconsax.save_add,
    //       size: 20,
    //     ),
    //     label:   Text(Labels.save),
    //   ),
    // );
    await SettingsController.instance.onCricket();
    onSave();
  }

  void onSave() {
    distance = double.parse(SettingsController.instance.cricketController.text);
    meterTextController.text = distance.toString();
    log("onSave: $distance");
    update([durationId, timerId]);
  }

  void getHistory() async {
    historyList = await DatabaseHelper.instance.readAllQuickTapCalcs();
    filterHistoryList.addAll(historyList);
    update();
    Get.toNamed(Routes.quickTapCalcHistory);
  }

  void filterHistory(String value) {
    if (value.isEmpty) {
      filterHistoryList.assignAll(historyList);
    } else {
      filterHistoryList.assignAll(historyList
          .where((element) =>
              element.bowler.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
    update();
  }

  void generateBowlerReports() async {
    // Fetch all bowler data
    List<QuickTapModel> bowlerHistory =
        await DatabaseHelper.instance.readAllQuickTapCalcs();

    //   data by bowler's name
    Map<String, List<QuickTapModel>> groupedData = {};
    for (var item in bowlerHistory) {
      if (!groupedData.containsKey(item.bowler)) {
        groupedData[item.bowler] = [];
      }
      groupedData[item.bowler]!.add(item);
    }

    // Calculate the reports for each bowler
    List<BowlerReport> reports = [];
    groupedData.forEach((name, history) {
      double minSpeed =
          history.map((item) => item.kmh).reduce((a, b) => a < b ? a : b);
      double maxSpeed =
          history.map((item) => item.kmh).reduce((a, b) => a > b ? a : b);
      double avgSpeed =
          history.map((item) => item.kmh).reduce((a, b) => a + b) /
              history.length;

      reports.add(BowlerReport(
        name: name,
        minSpeed: minSpeed,
        avgSpeed: avgSpeed,
        maxSpeed: maxSpeed,
      ));
    });

    // Update the observable list
    bowlerReports.assignAll(reports);
    filterList.assignAll(bowlerReports);

    update();
    Get.toNamed(Routes.bowlerReport);
  }

  void filterReports(String value) {
    if (value.isEmpty) {
      filterList.assignAll(bowlerReports);
    } else {
      filterList.assignAll(bowlerReports
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList());
    }
    update();
  }
}
