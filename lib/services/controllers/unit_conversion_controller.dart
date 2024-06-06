// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../../utils/labels.dart';

class UnitConversionController extends GetxController {
  TextEditingController distanceController = TextEditingController(text: '1.0');
  TextEditingController speedController = TextEditingController(text: '1.0');

  // List of units
  List<String> distanceUnits = [
    Labels.meter,
    Labels.kilometer,
    Labels.miles,
    Labels.yard,
    Labels.nauticalMiles
  ];

  List<String> speedUnits = [
    Labels.meterPerSecond,
    Labels.kilometerPerHour,
    Labels.milesPerHour,
    Labels.nauticalMilesPerHour,
  ];

  final distanceFormKey = GlobalKey<FormState>();
  final speedFormKey = GlobalKey<FormState>();

  // Selected units and values
  // String inputDistanceUnit = Labels.meter;
  // String outputDistanceUnit = Labels.kilometer;
  // String inputSpeedUnit = Labels.meterPerSecond;
  // String outputSpeedUnit = Labels.kilometerPerHour;
  double distanceConversionFactor = Constants.meterToKilometer;
  double speedConversionFactor = Constants.meterPerSecondToKilometerPerHour;
  late double distanceResult;
  late double speedResult;

  DistanceUnits inputDistanceUnit = DistanceUnits.meter;
  DistanceUnits outputDistanceUnit = DistanceUnits.kilometer;
  SpeedUnits inputSpeedUnit = SpeedUnits.meterPerSecond;
  SpeedUnits outputSpeedUnit = SpeedUnits.kilometerPerHour;

  @override
  void onInit() {
    calculateDistanceConversion();
    calculateSpeedConversion();
    super.onInit();
  }

  double get distance => double.tryParse(distanceController.text) ?? 1.0;
  double get speed => double.tryParse(speedController.text) ?? 1.0;
  bool get isDistanceFormValid => distanceFormKey.currentState!.validate();
  bool get isSpeedFormValid => speedFormKey.currentState!.validate();

  // Methods for distance conversion
  void updateInputDistanceUnit(DistanceUnits? value) {
    isDistanceFormValid;
    inputDistanceUnit = value ?? inputDistanceUnit;
    //log("after update input Dist. : $value");
    calculateDistanceConversion();
  }

  void updateOutputDistanceUnit(DistanceUnits? value) {
    isDistanceFormValid;
    outputDistanceUnit = value ?? outputDistanceUnit;
    //log("after update output Dist. : $value");
    calculateDistanceConversion();
  }

  void updateDistanceForm(String value) {
    isDistanceFormValid;
    log("value : $value");
    calculateDistanceConversion();
  }

  void calculateDistanceConversion() {
    distanceConversionFactor = convertDistance(
        inputDistanceUnit, outputDistanceUnit); //getDistanceConversionFactor();
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
    speedConversionFactor = convertSpeed(
        inputSpeedUnit, outputSpeedUnit); //getSpeedConversionFactor();
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

