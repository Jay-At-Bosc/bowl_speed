import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/routes/app_pages.dart';
import '../../utils/labels.dart';
import '../../widgets/custom_lable_text.dart';
import 'conversion_icon_label.dart';

class CalculationSection extends StatelessWidget {
  const CalculationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(bottom: 14),
      child: Column(
        children: [
          CustomLabelText(
            label: Labels.caculatorSection,
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConversionIconLabel(
                icon: Iconsax.add_square,
                label: Labels.manualCalculator,
                onTap: () {
                  Get.toNamed(Routes.manualCalculator);
                },
              ),
              ConversionIconLabel(
                icon: Iconsax.arrow_swap_horizontal,
                label: Labels.unitConversion,
                onTap: () => Get.toNamed(Routes.unitConversion),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
