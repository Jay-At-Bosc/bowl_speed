// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Pages/settings/custom_pitch_size_change_dialogue.dart';
import '../../utils/enums.dart';




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
