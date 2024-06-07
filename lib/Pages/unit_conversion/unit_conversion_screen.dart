// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/unit_conversion_controller.dart';

import '../../utils/enums.dart';
import '../../utils/formate_functions.dart';
import '../../utils/labels.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_menu_features.dart';
import 'custom_input_dropdown.dart';
import 'custom_output_dropdown.dart';

class UnitConversionScreen extends GetView<UnitConversionController> {
  const UnitConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Labels.unitConversion,
          style: GoogleFonts.rubik(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(226, 1, 74, 177),
        actions: [
          CustomMenuFeatures("Unit Conversion"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UnitConversionController>(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Speed conversion
              Text(
                Labels.convertDistance,
                style: GoogleFonts.rubik(color: Colors.black, fontSize: 20),
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
              Text(
                Labels.convertSpeed,
                style: GoogleFonts.rubik(color: Colors.black, fontSize: 20),
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
