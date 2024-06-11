// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/widgets/custom_snackbar.dart';
import 'labels.dart';

class Validators {
  static String? _validatePositiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) { 
      customSnackbar('${Labels.pleaseEnterThe} $fieldName');
      return "";
    } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
      customSnackbar(Labels.valueMustbeGreaterThanZero);
      return "";
    }
    return null;
  }

  static String? validatePitchSize(String? value) {
    return _validatePositiveNumber(value, Labels.distance);
  }

  static String? validateTime(String? value) {
    return _validatePositiveNumber(value, Labels.time);
  }

  static String? validateSpeed(String? value) {
    return _validatePositiveNumber(value, Labels.speed);
  }
}
