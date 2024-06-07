// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/manual_calc_controller.dart';
import '../../utils/labels.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_textformfield.dart';

class ManualCalculatorScreen extends GetView<ManualCalculatorController> {
  const ManualCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Labels.manualCalculator,
          isHistoryBtnVisible: true,
          onHistory: controller.getHistory,
         ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    filedTitle: Labels.pitchSize,
                    controller: controller.distanceController,
                    hintText: Labels.hintOfPitchSize,
                    validator: Validators.validatePitchSize,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                    filedTitle: Labels.timeOfTravel,
                    controller: controller.timeController,
                    hintText: Labels.hintOfTimeOfTravel,
                    validator: Validators.validateTime,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.calculateSpeed,
                      child: Text(
                        Labels.calculate,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 166, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
