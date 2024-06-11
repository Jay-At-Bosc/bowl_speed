import 'dart:developer';

import 'package:bowl_speed/imports_manager.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find<SettingsController>();
  String get gameTypeId => "gameTypeId";

  TextEditingController cricketController = TextEditingController();
  TextEditingController baseBallController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Sport selectedSport = Sport.cricket;

  void setSelectedSport(Sport sport) {
    log("Selected Sport : $sport");
    selectedSport = sport;
    update([gameTypeId]);
  }

  void onCricket() {
    log("cricket");
    customPitchSizeChangeDialog(
        cricketController, setCricetDefaultPitchMeter, formKey);
  }

  void onBaseBall() {
    log("baseBall");
    customPitchSizeChangeDialog(
        baseBallController, setBaseBallDefaultPitchMeter, formKey);
  }

  void setCricetDefaultPitchMeter() {
    // take controller instance and assign the value
    if (formKey.currentState!.validate()) {
      log("Cricet default pitch meter : ${cricketController.text}");
      QuickTapController.instance.distance =
          double.parse(cricketController.text);
    }
    Get.back();
  }

  void setBaseBallDefaultPitchMeter() {
    // take controller instance and assign the value
    if (formKey.currentState!.validate()) {
      log("BaseBall default pitch meter : ${baseBallController.text}");
      QuickTapController.instance.distance =
          double.parse(cricketController.text);
    }
    Get.back();
  }
}
