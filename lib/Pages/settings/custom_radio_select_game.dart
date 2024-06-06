
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/settings_controller.dart';

class CustomRadioButton extends GetWidget<SettingsController> {
  const CustomRadioButton(
      {super.key, required this.value, required this.label});
  final Sport value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      id: controller.gameTypeId,
      builder: (controller) {
        return Row(
          children: [
            Radio<Sport>(
              value: value,
              groupValue: controller.selectedSport,
              onChanged: (Sport? newValue) {
                if (newValue != null) {
                  controller.setSelectedSport(newValue);
                }
              },
            ),
            Text(label),
          ],
        );
      },
    );
  }
}