// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:bowl_speed/utils/validators.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/labels.dart';
import '../../widgets/custom_textformfield.dart';

class ManualCalculatorScreen extends GetView<ManualCalculatorController> {
  const ManualCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Labels.manualCalculator,
          isHistoryBtnVisible: true,
          onHistory: controller.getHistory,
        ),
        body: Padding(
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
                    focusNode: controller.distanceFocusNode,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                    filedTitle: Labels.timeOfTravel,
                    controller: controller.timeController,
                    hintText: Labels.hintOfTimeOfTravel,
                    validator: Validators.validateTime,
                    focusNode: controller.timeFocusNode,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.calculateSpeed();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeColor,
                      ),
                      child: Text(
                        Labels.calculate,
                        style: const TextStyle(color: Colors.white),
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
