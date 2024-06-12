import 'dart:developer';

import 'package:bowl_speed/imports_manager.dart';

class ManualCalculatorController extends GetxController {
  static ManualCalculatorController get instance =>
      Get.find<ManualCalculatorController>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  FocusNode distanceFocusNode = FocusNode();
  FocusNode timeFocusNode = FocusNode();

  double get distance => double.parse(distanceController.text);
  double get time => double.parse(timeController.text);
  late String result;
  late double speedMps; // meter per second
  late double speedKmph; // kilometer per hour
  late double speedMph; // mile per hour
  late List<ManualCalcModel> historyList;

  @override
  void onInit() async {
    historyList = await DatabaseHelper.instance.readAllManualCalcs();
    super.onInit();
  }

  void calculateSpeed() async {
    if (distanceFocusNode.hasFocus || timeFocusNode.hasFocus) {
      distanceFocusNode.unfocus();
      timeFocusNode.unfocus();
    }
    if (formKey.currentState!.validate()) {
      speedMps = distance / time;
      speedKmph = speedMps * 3.6;
      speedMph = speedMps * 2.237;
      result =
          '${speedKmph.toStringAsFixed(3)} km/h - ${speedMph.toStringAsFixed(3)} mph';

      customAnimatedDialogue(Get.context!, Labels.result, result, onSave);
    }
  }

  void onSave() async {
    // save data
    log("on save");
    ManualCalcModel manualCalcModel = ManualCalcModel(
      distance: distance,
      time: time,
      kmh: speedKmph,
      mph: speedMph,
      measurementType: Labels.manualCalculator,
      date: formatDateTime(DateTime.now()),
    );

    await DatabaseHelper.instance.insertManualCalculator(manualCalcModel);

    Get.back();
  }

  void getHistory() async {
    historyList = await DatabaseHelper.instance.readAllManualCalcs();
    Get.toNamed(Routes.manualCalcHistory);
  }
}
