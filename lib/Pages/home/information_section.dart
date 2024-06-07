import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/routes/app_pages.dart';
import '../../widgets/custom_rounded_icon.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration:
          BoxDecoration(color: AppColors.containerColor.withOpacity(0.5)),
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
                // Get.to(() => const BowlerRe());
              },
            ),
            CustomRoundedIcon(
              icon: Iconsax.setting_2,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: Labels.settings,
              onTap: () => Get.toNamed(Routes.settings),
            ),
            CustomRoundedIcon(
              icon: Iconsax.info_circle,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: Labels.howToUse,
              onTap: () => Get.toNamed(Routes.howToUse),
            ),
          ],
        ),
      ),
    );
  }
}
