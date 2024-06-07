import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/labels.dart';
import '../../widgets/custom_lable_text.dart';

import '../manual_calculator/manual_calculator_screen.dart';
import '../unit_conversion/unit_conversion_screen.dart';
import 'conversion_icon_label.dart';

class CalculationSection extends StatelessWidget {
  const CalculationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0)
          .copyWith(bottom: 14),
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
                  Get.to(() => const ManualCalculatorScreen());
                },
              ),
              ConversionIconLabel(
                icon: Iconsax.arrow_swap_horizontal,
                label: Labels.unitConversion,
                onTap: () {
                  Get.to(() => const UnitConversionScreen());
                },
              ),
            ],
          ),
          // const SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }
}