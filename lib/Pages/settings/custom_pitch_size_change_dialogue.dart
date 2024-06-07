// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          decoration: InputDecoration(
            label: Text(Labels.enterMeter),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.amber[100],
            filled: true,
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
            ()=> AppPages.back,
            Labels.cancel,
            Colors.grey,
            Colors.black,
            Icons.cancel,
          ),
          customElevatedButtonWithIcon(
            onChange,
            Labels.change,
            Colors.orange[400]!,
            Colors.white,
            Icons.check_circle_outline,
          ),
        ],
      ),
      
    ],
  );
}
