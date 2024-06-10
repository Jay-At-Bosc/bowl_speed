import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'custom_drop_down.dart';
import 'custom_lable_text.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
    this.isDropDown = false,
    this.list,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final bool isDropDown;
  final List<String>? list;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabelText(
            label: label,
            style: GoogleFonts.rubik(
                fontSize: 16,
                color: AppColors.blueColor.withOpacity(0.7),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          isDropDown
              ? CustomDropDown(list: list, label: label)
              : TextFormField(
                  keyboardType: keyboardType,
                  autofocus: false,
                  controller: controller,
                  cursorColor: AppColors.blueColor,
                  cursorErrorColor: Colors.red,
                  style: GoogleFonts.rubik(
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueColor.withOpacity(0.9)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 14),
                    hintText: label,
                    hintStyle: GoogleFonts.rubik(
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueColor.withOpacity(0.6)),
                    filled: true,
                    fillColor: AppColors.orangeColor.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.greenColor, width: 0.5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "$label is required";
                    }
                    return null;
                  },
                ),
        ],
      ),
    );
  }
}
