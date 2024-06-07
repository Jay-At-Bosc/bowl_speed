import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/custom_rounded_icon.dart';
import '../how_to_use/how_to_use_screen.dart';
import '../settings/settings_screen.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      // decoration: BoxDecoration(color: AppColors.containerColor.withOpacity(1)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomRoundedIcon(
              icon: Iconsax.receipt_2,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: Labels.bowlerReport,
              onTap: () {
                QuickTapController.instance.generateBowlerReports();
              },
            ),
            CustomRoundedIcon(
              icon: Iconsax.setting_2,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: Labels.settings,
              onTap: () {
                Get.to(() => const SettingsScreen());
              },
            ),
            CustomRoundedIcon(
              icon: Iconsax.info_circle,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: Labels.howToUse,
              onTap: () {
                Get.to(() => const HowToUseScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
