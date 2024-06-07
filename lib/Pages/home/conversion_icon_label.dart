import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/widgets/custom_lable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversionIconLabel extends StatelessWidget {
  const ConversionIconLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
            color: AppColors.orangeColor,
          ),
          const SizedBox(
            height: 6,
          ),
          CustomLabelText(
            label: label,
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
