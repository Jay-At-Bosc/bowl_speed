import 'dart:async';
import 'dart:developer';
import 'package:bowl_speed/imports_manager.dart';

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
    customAnimatedDialogue(
      Get.context!,
      Labels.result,
      result,
      () async {
        QuickTapModel model = QuickTapModel(
            bowler: selectedBowler.toLowerCase(),
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
    if (selectedBowler.isNotEmpty) {
      // filterHistoryList.addAll(historyList);
      filterHistoryList.clear();
      filterHistoryList.addAll(historyList
          .where((element) => element.bowler
              .toLowerCase()
              .contains(selectedBowler.toLowerCase()))
          .toList());
    } else {
      filterHistoryList.addAll(historyList);
    }
    update();
    Get.toNamed(Routes.quickTapCalcHistory);
  }

  void updatedHistory() async {
    historyList = await DatabaseHelper.instance.readAllQuickTapCalcs();
    if (selectedBowler.isNotEmpty) {
      // filterHistoryList.addAll(historyList);
      filterHistoryList.clear();
      filterHistoryList.addAll(historyList
          .where((element) => element.bowler
              .toLowerCase()
              .contains(selectedBowler.toLowerCase()))
          .toList());
    } else {
      filterHistoryList.addAll(historyList);
    }
    update();
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
