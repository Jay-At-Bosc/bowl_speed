// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/unit_conversion_controller.dart';
import '../../utils/colors.dart';
import '../../utils/enums.dart';

class CustomOutputDropdown<T extends Unit>
    extends GetView<UnitConversionController> {
  const CustomOutputDropdown(
      {super.key,
      required this.dropdownValue,
      required this.dropdownItems,
      this.dropdownonChanged,
      required this.result});

  final String result;
  final T dropdownValue;
  final List<T> dropdownItems;
  final void Function(T?)? dropdownonChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.blueColor, width: 1),
              ),
              child: DropdownButton<T>(
                style: GoogleFonts.rubik(
                  color: AppColors.textDarkColor,
                  fontWeight: FontWeight.w400,
                ),
                value: dropdownValue,
                underline: SizedBox(),
                items: dropdownItems.map((T unit) {
                  return DropdownMenuItem<T>(
                    value: unit,
                    child: Text(unit.getLabel),
                  );
                }).toList(),
                onChanged: dropdownonChanged,
              ),
            ),
          ),
          SizedBox(width: 6),
          Flexible(
            flex: 4,
            child: GetBuilder<UnitConversionController>(builder: (context) {
              return TextField(
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.rubik(
                      color: AppColors.textDarkColor.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  labelText: result,
                  enabled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.blueColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.blueColor),
                  ),
                ),
                readOnly: true,
              );
            }),
          ),
        ],
      ),
    );
  }
}
