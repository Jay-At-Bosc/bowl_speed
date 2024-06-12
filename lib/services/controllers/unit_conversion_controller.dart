// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../../utils/enums.dart';

class UnitConversionController extends GetxController {
  TextEditingController distanceController = TextEditingController(text: '1.0');
  TextEditingController speedController = TextEditingController(text: '1.0');

  FocusNode distanceFocusNode = FocusNode();
  FocusNode speedFocusNode = FocusNode();

  final distanceFormKey = GlobalKey<FormState>();
  final speedFormKey = GlobalKey<FormState>();

  late double distanceResult;
  late double speedResult;

  DistanceUnits inputDistanceUnit = DistanceUnits.meter;
  DistanceUnits outputDistanceUnit = DistanceUnits.kilometer;
  SpeedUnits inputSpeedUnit = SpeedUnits.meterPerSecond;
  SpeedUnits outputSpeedUnit = SpeedUnits.kilometerPerHour;
  double distanceConversionFactor = Constants.meterToKilometer;
  double speedConversionFactor = Constants.meterPerSecondToKilometerPerHour;

  @override
  void onInit() {
    calculateDistanceConversion();
    calculateSpeedConversion();
    super.onInit();
  }

  double get distance => double.tryParse(distanceController.text) ?? 0.0;
  double get speed => double.tryParse(speedController.text) ?? 0.0;
  bool get isDistanceFormValid => distanceFormKey.currentState!.validate();
  bool get isSpeedFormValid => speedFormKey.currentState!.validate();

  // Methods for distance conversion
  void updateInputDistanceUnit(DistanceUnits? value) {
    isDistanceFormValid;
    inputDistanceUnit = value ?? inputDistanceUnit;
    log("after update input Dist. : $value");
    calculateDistanceConversion();
  }

  void updateOutputDistanceUnit(DistanceUnits? value) {
    isDistanceFormValid;
    outputDistanceUnit = value ?? outputDistanceUnit;
    log("after update output Dist. : $value");
    calculateDistanceConversion();
  }

  void updateDistanceForm(String value) {
    isDistanceFormValid;
    log("value : $value");
    calculateDistanceConversion();
  }

  void calculateDistanceConversion() {
    distanceFocusNode.unfocus();

    distanceConversionFactor =
        convertDistance(inputDistanceUnit, outputDistanceUnit);
    log("converstion factor : $distanceConversionFactor");

    distanceResult = distance * distanceConversionFactor;
    log("distance result : $distanceResult");
    update();
  }

  /// Methods for speed conversion
  void updateInputSpeedUnit(SpeedUnits? value) {
    isSpeedFormValid;
    inputSpeedUnit = value ?? inputSpeedUnit;
    log("after update input Speed. : $value");
    calculateSpeedConversion();
  }

  void updateOutputSpeedUnit(SpeedUnits? value) {
    isSpeedFormValid;
    outputSpeedUnit = value ?? outputSpeedUnit;
    log("after update output Speed. : $value");
    calculateSpeedConversion();
  }

  void updateSpeedForm(String value) {
    isSpeedFormValid;
    log("value : $value");
    calculateSpeedConversion();
  }

  void calculateSpeedConversion() {
    speedFocusNode.unfocus();

    speedConversionFactor = convertSpeed(inputSpeedUnit, outputSpeedUnit);
    log("converstion factor : $speedConversionFactor");

    speedResult = speed * speedConversionFactor;
    log("speed result : $speedResult");
    update();
  }

  double convertDistance(DistanceUnits from, DistanceUnits to) {
    String converstionString = "${from.name}To${to.name.capitalizeFirst}";
    log("convertDistance String: $converstionString");
    log("convertDistance Factor: ${Constants.distanceFactors[converstionString]}");
    return Constants.distanceFactors[converstionString] ?? 1.0;
  }

  double convertSpeed(SpeedUnits from, SpeedUnits to) {
    String converstionString = "${from.name}To${to.name}";
    log("convertSpeed String: $converstionString");
    log("convertSpeed Factor: ${Constants.speedFactors[converstionString]}");
    return Constants.speedFactors[converstionString] ?? 1.0;
  }
}
