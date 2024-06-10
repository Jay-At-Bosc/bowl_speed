// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:bowl_speed/widgets/custom_lable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/unit_conversion_controller.dart';

import '../../utils/enums.dart';
import '../../utils/formate_functions.dart';
import '../../utils/labels.dart';
import '../../utils/validators.dart';
import 'custom_input_dropdown.dart';
import 'custom_output_dropdown.dart';

class UnitConversionScreen extends GetView<UnitConversionController> {
  const UnitConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.unitConversion,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UnitConversionController>(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Speed conversion
              CustomLabelText(
                label: Labels.convertDistance,
                style: GoogleFonts.rubik(
                  color: AppColors.blueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // Input Dropdown
              CustomInputDropdown<DistanceUnits>(
                dropdownValue: controller.inputDistanceUnit,
                dropdownItems: DistanceUnits.values.toList(),
                dropdownonChanged: controller.updateInputDistanceUnit,
                formController: controller.distanceController,
                formOnChanged: controller.updateDistanceForm,
                validator: Validators.validatePitchSize,
                formKey: controller.distanceFormKey,
              ),
              const SizedBox(
                height: 12,
              ),
              // Output Dropdown
              CustomOutputDropdown<DistanceUnits>(
                dropdownValue: controller.outputDistanceUnit,
                dropdownItems: DistanceUnits.values.toList(),
                result: formatDouble(controller.distanceResult),
                dropdownonChanged: controller.updateOutputDistanceUnit,
              ),
              SizedBox(
                height: 20,
              ),

              /// Speed conversion
              CustomLabelText(
                label: Labels.convertSpeed,
                style: GoogleFonts.rubik(
                  color: AppColors.blueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // Input Dropdown
              CustomInputDropdown<SpeedUnits>(
                dropdownValue: controller.inputSpeedUnit,
                dropdownItems: SpeedUnits.values.toList(),
                dropdownonChanged: controller.updateInputSpeedUnit,
                formController: controller.speedController,
                formOnChanged: controller.updateSpeedForm,
                formKey: controller.speedFormKey,
                validator: Validators.validateSpeed,
              ),

              const SizedBox(
                height: 12,
              ),
              // Output Dropdown
              CustomOutputDropdown<SpeedUnits>(
                dropdownValue: controller.outputSpeedUnit,
                dropdownItems: SpeedUnits.values.toList(),
                result: controller.speedResult.toStringAsFixed(3),
                dropdownonChanged: controller.updateOutputSpeedUnit,
              ),
            ],
          );
        }),
      ),
    );
  }
}
