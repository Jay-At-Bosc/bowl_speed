// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/routes/app_routes.dart';
import '../../utils/labels.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_elevated_button_with_icon.dart';

void customPitchSizeChangeDialog(
    TextEditingController controller, Function() onChange, Key key) {
  Get.defaultDialog(
    title: Labels.changePitchMeter,
    titleStyle: TextStyle(fontSize: 22.0),
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: key,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.blueColor,
          cursorErrorColor: Colors.red,
          style: GoogleFonts.rubik(
            fontSize: 14,
            height: 1.3,
            fontWeight: FontWeight.w500,
            color: AppColors.blueColor.withOpacity(0.9),
          ),
          decoration: InputDecoration(
            label: Text(Labels.enterMeter),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 14),
            hintStyle: GoogleFonts.rubik(
                fontSize: 14,
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: AppColors.blueColor.withOpacity(0.6)),
            filled: true,
            fillColor: AppColors.orangeColor.withOpacity(0.1),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.greenColor, width: 0.5),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor1),
              borderRadius: BorderRadius.circular(14),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          validator: Validators.validatePitchSize,
        ),
      ),
    ),
    actions: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customElevatedButtonWithIcon(
            () => AppPages.back,
            Labels.cancel,
            Colors.white,
            AppColors.orangeColor,
            Icons.cancel,
          ),
          customElevatedButtonWithIcon(
            onChange,
            Labels.change,
            AppColors.orangeColor,
            Colors.white,
            Icons.check_circle_outline,
          ),
        ],
      ),
    ],
  );
}
