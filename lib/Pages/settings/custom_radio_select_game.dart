import 'package:bowl_speed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/settings_controller.dart';
import '../../utils/enums.dart';

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
              activeColor: AppColors.orangeColor,
              groupValue: controller.selectedSport,
              onChanged: (Sport? newValue) {
                if (newValue != null) {
                  controller.setSelectedSport(newValue);
                }
              },
            ),
            Text(
              label,
              style: GoogleFonts.rubik(),
            ),
          ],
        );
      },
    );
  }
}
